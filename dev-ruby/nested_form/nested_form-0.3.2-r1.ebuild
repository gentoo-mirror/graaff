# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="vendor"

inherit ruby-fakegem

DESCRIPTION="A Rails gem for conveniently manage multiple nested models in a single form."
HOMEPAGE="https://github.com/ryanb/nested_form"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
