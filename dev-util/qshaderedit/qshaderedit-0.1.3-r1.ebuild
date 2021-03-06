# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit cmake-utils

DESCRIPTION="A simple multiplatform shader editor inspired by Apple's OpenGL Shader Builder"
HOMEPAGE="http://code.google.com/p/qshaderedit/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/glew
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtopengl:4"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

DOCS=( AUTHORS ChangeLog )
