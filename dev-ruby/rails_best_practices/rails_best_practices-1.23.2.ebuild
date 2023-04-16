# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="assets rails_best_practices.yml"

inherit ruby-fakegem

DESCRIPTION="a gem to check quality of rails app files"
HOMEPAGE="https://rails-bestpractices.com/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/haml:5 )"

ruby_add_rdepend "
	dev-ruby/activesupport:*
	>=dev-ruby/code_analyzer-0.5.5
	dev-ruby/erubis
	dev-ruby/i18n:*
	dev-ruby/json:*
	dev-ruby/require_all:3
	dev-ruby/ruby-progressbar"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/d' Rakefile || die
	rm Gemfile || die

	sed -i -e '/coverall/I d ; 1igem "haml", "~> 5.0"' spec/spec_helper.rb || die

	# Avoid slim specs since we don't have that available.
	sed -e '/should law of demeter with slim/,/end/ s:^:#:' \
		-i spec/rails_best_practices/reviews/law_of_demeter_review_spec.rb || die
	sed -e '/should move code into model with slim/,/end/ s:^:#:' \
		-i spec/rails_best_practices/reviews/move_code_into_model_review_spec.rb || die
	sed -e '/local varialbe in slim file/,/end/ s:^:#:' \
		-i spec/rails_best_practices/reviews/replace_instance_variable_with_local_variable_review_spec.rb || die
}
