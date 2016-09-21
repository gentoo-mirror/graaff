# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Use of web components and polymer-project in Ruby on Rails projects"
HOMEPAGE="https://github.com/alchapone/polymer-rails"
SRC_URI="https://github.com/alchapone/polymer-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/nokogiri-1.6
	>=dev-ruby/nokogumbo-1.4.2
	>=dev-ruby/rails-3.1.0:*
	dev-ruby/sprockets:3
"

all_ruby_prepare() {
	# Gem locks to nokogumbo 1.4.2 due to bugs in 1.4.3. We no longer have these old versions so let's try 1.4.9.
	sed -i -e '/nokogumbo/ s/1.4.2/~> 1.4.2/' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_prepare() {
	case ${RUBY} in
		*ruby21)
			# Fails due to ordering issues
			sed -i -e '/generates html import tag/ s:it:pending:' spec/asset_tag_helper_spec.rb || die
			;;
	esac
}
