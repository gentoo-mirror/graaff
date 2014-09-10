# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

GITHUB_COMMIT="d122bb70c8bf479fc7a13737d707082e08966e20"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.txt RULES"

# There are specs but they require an old version of rspec.
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Inspect and process video or audio files."
HOMEPAGE="https://github.com/zencoder/rvideo"
SRC_URI="https://github.com/zencoder/rvideo/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${GITHUB_COMMIT}"

LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE="doc flv"

RUBY_PATCHES=( rvideo-ffmpeg.patch )

ruby_add_rdepend "flv? ( media-video/flvtool2 )"
