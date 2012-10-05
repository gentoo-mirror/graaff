# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRAINSTALL="rails_best_practices.yml"

inherit ruby-fakegem

DESCRIPTION="a gem to check quality of rails app files"
HOMEPAGE="http://wiki.github.com/flyerhzm/rails_best_practices"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

ruby_add_rdepend "
	dev-ruby/code_analyzer
	dev-ruby/colored
	dev-ruby/erubis
	dev-ruby/activesupport
	dev-ruby/i18n
	dev-ruby/ruby-progressbar"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/d' Rakefile || die
	rm Gemfile || die

	# Avoid slim specs since we don't have that available.
	sed -i -e '/should law of demeter with slim/,/end/ s:^:#:' spec/rails_best_practices/reviews/law_of_demeter_review_spec.rb || die
	sed -i -e '/should move code into model with slim/,/end/ s:^:#:' spec/rails_best_practices/reviews/move_code_into_model_review_spec.rb || die
	sed -i -e '/local varialbe in slim file/,/end/ s:^:#:' spec/rails_best_practices/reviews/replace_instance_variable_with_local_variable_review_spec.rb || die
}
