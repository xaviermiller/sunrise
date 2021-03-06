# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="A free cross-platform pipe connecting game"
HOMEPAGE="http://home.gna.org/vodovod/"
SRC_URI="http://download.gna.org/${PN}/${P}-src.tar.gz"

S=${WORKDIR}/${P}-src
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/libsdl
		media-libs/sdl-mixer
		media-libs/sdl-image"
RDEPEND=${DEPEND}

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -e 's:"\(data/[^"]*\)":"'${GAMES_DATADIR}'/'${PN}'/\1":g' -i *.cpp || die
	epatch "${FILESDIR}/${P}-gcc4.3.patch"
}

src_install() {
	dogamesbin "${PN}" || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}/${PN}/data"
	doins data/* || die "doins failed"
	#doicon ${DISTDIR}/${PN}.png
	make_desktop_entry ${PN} "Vodovod"
	prepgamesdirs
}
