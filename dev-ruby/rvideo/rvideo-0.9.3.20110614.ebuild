# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

# No longer works because the Hoe support is too old
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="History.txt README.txt RULES"

# There are specs but they require an old version of rspec.
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Inspect and process video or audio files."
HOMEPAGE="https://github.com/zencoder/rvideo"
LICENSE="MIT"

# Use a fork for now which has ruby 1.9 and recent ffmpeg fixes.
SRC_URI="https://github.com/scottburton11/rvideo/tarball/d122bb70c8bf479fc7a13737d707082e08966e20 -> ${P}.tgz"
RUBY_S="scottburton11-rvideo-*"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE="flv"

ruby_add_rdepend "flv? ( media-video/flvtool2 )"
