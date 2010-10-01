# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils qt4-r2

MY_P=${PN}_${PV}

DESCRIPTION="Tool for sending SMS and sending/receiving JackSMS-Message-Service"
HOMEPAGE="http://www.jacksms.it/"
SRC_URI="http://download.opensuse.org/repositories/home:/grisson/xUbuntu_10.04/${MY_P}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="dev-util/ticpp
	x11-libs/qt-core:4
	x11-libs/qt-gui:4"
RDEPEND="${DEPEND}"

src_install() {
	dobin QtJackSMS || die
	doicon ${PN}.png|| die
	make_desktop_entry QtJackSMS \
		"JackSMS Desktop" \
		${PN} \
		"Application;Network;"
}