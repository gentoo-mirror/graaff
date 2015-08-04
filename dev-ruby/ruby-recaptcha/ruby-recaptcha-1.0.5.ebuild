# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="History.txt README.txt"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="The ReCaptchaClient abstracts the ReCaptcha API for use in Rails Applications"
HOMEPAGE="http://www.bitbucket.org/mml/ruby-recaptcha"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/mocha:0.14 dev-ruby/rails )"

all_ruby_prepare() {
	sed -e '1igem "mocha", "~>0.14.0"' -i test/test_helper.rb || die
}

each_ruby_test() {
	${RUBY} -I. test/test_recaptcha.rb || die
}
