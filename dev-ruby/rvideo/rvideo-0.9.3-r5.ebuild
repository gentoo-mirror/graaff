# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="ENV ENV2 History.txt README.txt RULES"

# There are specs but they require an old version of rspec.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="Inspect and process video or audio files."
HOMEPAGE="https://github.com/zencoder/rvideo/issues"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

all_ruby_prepare() {
	eapply -p0 "${FILESDIR}/rvideo-ffmpeg.patch"
	eapply -p0 "${FILESDIR}/rvideo-output-encoding.patch"
}
