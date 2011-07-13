# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ree18 jruby"

# Documentation uses hanna, but hanna is broken with newer versions of
# RDoc.
RUBY_FAKEGEM_TASK_DOC="-Ilib yard"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for libnotify using FFI."
HOMEPAGE="https://github.com/splattael/libnotify"
# https://github.com/splattael/libnotify/issues/6
LICENSE="unknown"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

ruby_add_rdepend "virtual/ruby-ffi"

ruby_add_bdepend "doc? ( dev-ruby/yard )"
ruby_add_bdepend "test? ( dev-ruby/minitest )"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' -e '/rubies.rake/d' Rakefile test/helper.rb || die
}
