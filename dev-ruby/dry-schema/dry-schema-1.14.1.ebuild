# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_GEMSPEC="dry-schema.gemspec"

inherit ruby-fakegem

DESCRIPTION="A DSL for defining schemas with keys and rules that should be applied to values"

HOMEPAGE="https://dry-rb.org/gems/dry-schema/"
SRC_URI="https://github.com/dry-rb/dry-schema/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	dev-ruby/concurrent-ruby:1
	>=dev-ruby/dry-configurable-1.0.1:1
	dev-ruby/dry-core:1
	dev-ruby/dry-initializer:3
	>=dev-ruby/dry-logic-1.4:1
	>=dev-ruby/dry-types-1.7:1
	>=dev-ruby/zeitwerk-2.6:2
"

ruby_add_depend "test? ( dev-ruby/json-schema dev-ruby/dry-struct dev-ruby/super_diff )"

all_ruby_prepare() {
	# Avoid raising errors for ruby warnings (similar to avoiding -Werror)
	sed -e '/Warning/ s:^:#:' -i spec/spec_helper.rb || die

	# Avoid spec breaking on missing to_json method
	sed -e '/infers with correct default options/ s/to_json/to_s/' \
		-i spec/extensions/json_schema/schema_spec.rb || die

	# Avoid a broken spec that has ping-pong commits upstream
	sed -e '/can use a proc for a message/ s/it/xit/' \
		-i spec/integration/messages/i18n_spec.rb || die

	# Avoid unpackaged json_schemer.
	rm -f spec/extensions/json_schema/schema_spec.rb || die
}
