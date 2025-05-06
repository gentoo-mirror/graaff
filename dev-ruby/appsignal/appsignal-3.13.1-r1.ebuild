# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md SUPPORT.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="ext resources"

RUBY_FAKEGEM_EXTENSIONS=(ext/extconf.rb)

AGENT_VERSION="0.35.19"

inherit flag-o-matic ruby-fakegem

DESCRIPTION="The official appsignal.com gem"
HOMEPAGE="https://docs.appsignal.com/ruby"
SRC_URI="https://rubygems.org/gems/appsignal-${PV}.gem https://appsignal-agent-releases.global.ssl.fastly.net/${AGENT_VERSION}/appsignal-x86_64-linux-all-static.tar.gz -> appsignal-x86_64-${PV}.patch.bz2"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/rack:*
"

ruby_add_bdepend "test? (
	dev-ruby/bundler
	dev-ruby/timecop
	dev-ruby/webmock
)"

all_ruby_prepare() {
	sed -i -e '/rake/ s/~>/>=/' -e '/\("rubocop\|pry\)/ s:^:#:' appsignal.gemspec || die
	sed -i -e '/pry/ s:^:#:' spec/spec_helper.rb || die
	echo 'gem "json"' >> Gemfile || die
	echo 'gem "rexml"' >> Gemfile || die

	# This is a horrible hack to work around the default unpack support
	# in all_ruby_unpack which tries to unpack all files in ${A} and
	# then fails. But it leaves a patch.bz2 file untouched...
	pushd ext || die
	cp "${DISTDIR}/appsignal-x86_64-${PV}.patch.bz2" appsignal-x86_64-linux-all-static.tar.gz || die
	popd || die
	sed -i -e 's/download_archive(library_type)/open("appsignal-x86_64-linux-all-static.tar.gz")/' ext/extconf.rb || die

	# Avoid specs that require a network
	sed -e '/\(the\|extension\) installation report/askip "requires live network"' \
		-i spec/lib/appsignal/cli/diagnose_spec.rb || die

	# Fix spec that expect a specific command name
	sed -e '/process_name/ s/rspec/rspec-3/' -i spec/lib/appsignal/probes/gvl_spec.rb || die
}

each_ruby_configure() {
	append-flags --std=gnu17
	filter-flags --std=gnu23

	each_fakegem_configure
}

each_ruby_test() {
	${RUBY} -S bundle exec rspec-3 spec || die
}

each_ruby_install() {
	each_fakegem_install

	local extdir
	extdir="$(ruby_fakegem_gemsdir)/gems/${RUBY_FAKEGEM_NAME}-${RUBY_FAKEGEM_VERSION}/ext"

	fperms 0755 "${extdir}/appsignal-agent"
}
