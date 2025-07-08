# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="config libexec template-dir"

RUBY_FAKEGEM_GEMSPEC="overcommit.gemspec"

inherit ruby-fakegem

DESCRIPTION="The Opinionated Git Hook Manager"
HOMEPAGE="https://github.com/sds/overcommit"
SRC_URI="https://github.com/sds/overcommit/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend "
	dev-ruby/childprocess:5
	>=dev-ruby/iniparse-1.4:1
	>=dev-ruby/rexml-3.3.9:3
"

all_ruby_prepare() {
	sed -i -e "s/_relative //" ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -e '/simplecov/,/^end/ s:^:#:' \
		-i spec/spec_helper.rb || die

	# Use non-deprecated command for erb_lint
	sed -e '/required_executable/ s/erblint/erb_lint/' \
		-i config/default.yml || die

	# Avoid specs that expect a git directory. This can probably be
	# narrowed down a bit more to specific tests but we did not run
	# tests at all before.
	rm -f spec/overcommit/{configuration,installer}_spec.rb \
	   spec/overcommit/hook_context/{pre_commit,commit_msg}_spec.rb \
	   spec/overcommit/hook/pre_push/minitest_spec.rb || die
	sed -e '/when configuration explicitly sets the gemfile to false/ s/context/xcontext/' \
		-i spec/integration/gemfile_option_spec.rb || die
	# Tries to call out to overcommit binary without ensuring it is the new version.
	rm -f spec/integration/diff_flag_spec.rb || die
}

each_ruby_install() {
	each_fakegem_install

	local hdir
	hdir="$(ruby_fakegem_gemsdir)/gems/${RUBY_FAKEGEM_NAME}-${RUBY_FAKEGEM_VERSION}/template-dir/hooks"

	fperms 0755 "${hdir}"/{commit-msg,overcommit-hook,post-checkout,post-commit,post-merge,post-rewrite,pre-commit,prepare-commit-msg,pre-push,pre-rebase}
}
