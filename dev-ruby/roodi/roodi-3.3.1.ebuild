# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRAINSTALL="roodi.yml"

inherit ruby-fakegem

DESCRIPTION="Roodi stands for Ruby Object Oriented Design Inferometer"
HOMEPAGE="http://rubyforge.org/projects/roodi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#RUBY_PATCHES=( ${P}-yaml.patch )

ruby_add_rdepend ">=dev-ruby/ruby_parser-3.2.2:3"

all_ruby_prepare() {
	sed -i -e '/coverall/I s:^:#:' spec/spec_helper.rb || die
}
