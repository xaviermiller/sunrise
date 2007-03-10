# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit qt4 games

DESCRIPTION="Free Worms-like turn based strategy game"
SRC_URI="http://hedgewars.org/download/${PN}-src-${PV}.tar.bz2"

HOMEPAGE="http://hedgewars.org/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND=">=dev-util/cmake-2.4.0 
	$(qt4_min_version 4.2)
	>=dev-lang/fpc-1.9.4
	media-libs/libsdl
	media-libs/sdl-ttf
	media-libs/sdl-mixer
	media-libs/sdl-image
	media-libs/sdl-net"

RDEPEND="${DEPEND}"

src_compile() {
	cmake	-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
		-DCMAKE_INSTALL_PREFIX="${GAMES_PREFIX}" \
		-DDATA_INSTALL_DIR="${GAMES_DATADIR}" \
		. || die "cmake failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	prepgamesdirs
}
