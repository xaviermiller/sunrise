# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Suunto Cobra, Mosquito, Spyder, Stinger, Vyper ,Vytec plugins for
gdivelog"
HOMEPAGE="http://gdivelog.sourceforge.net/"
SRC_URI="mirror://sourceforge/gdivelog/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-apps/gdivelog"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
