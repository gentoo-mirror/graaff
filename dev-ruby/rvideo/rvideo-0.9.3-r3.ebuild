# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="ENV ENV2 History.txt README.txt RULES"

# There are specs but they require an old version of rspec.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="Inspect and process video or audio files."
HOMEPAGE="http://code.google.com/p/rvideo/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE="doc flv"

RUBY_PATCHES=( rvideo-ffmpeg.patch rvideo-output-encoding.patch )

ruby_add_rdepend "flv? ( media-video/flvtool2 )"
