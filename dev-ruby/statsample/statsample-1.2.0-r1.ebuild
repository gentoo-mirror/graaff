# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="README.txt"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_GEMSPEC="statsample.gemspec"

inherit ruby-fakegem

DESCRIPTION="Making YAML easy and fun to use with Ruby"
HOMEPAGE="http://www.metabates.com"
LICENSE="GPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend "
	dev-ruby/dirty-memoize
	>=dev-ruby/distribution-0.6
	>=dev-ruby/extendmatrix-0.3.1"
USE_RUBY="ruby18 ree18 jruby" ruby_add_rdepend "dev-ruby/fastercsv"

# dirty-memoize (~> 0.0)
# distribution (~> 0.6)
# extendmatrix (~> 0.3.1)
# fastercsv (> 0)

# reportbuilder (~> 1.4)
# rserve-client (~> 0.2.5)
# rubyvis (~> 0.5)
# spreadsheet (~> 0.6.5)
# statsample-bivariate-extension (> 0)

# gettext (~> 0, development)
# hoe (~> 0, development)
# hoe (~> 2.12, development)
# hoe-git (~> 0, development)
# minimization (~> 0.2.0)
# minitest (~> 2.0, development)
# mocha (~> 0, development)
# rserve-client (~> 0, development)
# shoulda (~> 0, development)

all_ruby_prepare() {
	# Nasty hack to avoid adding a bunch of dependencies I don't need now...
	sed -i -e '/reportbuilder/d' lib/statsample.rb || die

	# Create a gemspec file that we can use and hack it to remove all
	# the stuff we skip for now.
	ruby -S rake -r rdoc/task debug_gem | sed -e '1d' > statsample.gemspec

	# Remove all dependencies from the gemspec that we don't need
	# right now.
	sed -i -e '/minimization/d' -e '/reportbuilder/d' -e '/rserve-client/d' -e '/spreadsheet/d' -e '/bivariate-extension/d' -e '/rubyvis/d' statsample.gemspec
}

each_ruby_prepare() {
	case ${RUBY} in
		*ruby19)
			sed -i -e '/fastercsv/d' statsample.gemspec || die
			;;
	esac
}
