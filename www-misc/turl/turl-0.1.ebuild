# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="a command-line interface to http://metamark.net/"
HOMEPAGE="http://ndansmith.net/turl.php"
SRC_URI="http://ndansmith.net/software/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"
