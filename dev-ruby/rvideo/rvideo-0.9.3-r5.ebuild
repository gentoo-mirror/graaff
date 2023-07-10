# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="ENV ENV2 History.txt README.txt RULES"

# There are specs but they require an old version of rspec.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="Inspect and process video or audio files."
HOMEPAGE="https://github.com/zencoder/rvideo/issues"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

all_ruby_prepare() {
	eapply -p0 "${FILESDIR}/rvideo-ffmpeg.patch"
	eapply -p0 "${FILESDIR}/rvideo-output-encoding.patch"
}
