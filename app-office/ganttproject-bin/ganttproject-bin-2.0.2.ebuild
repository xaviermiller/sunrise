# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

KEYWORDS="~x86"

MY_P=${PN/-bin}-${PV}

DESCRIPTION="A tool for creating a project schedule by means of Gantt chart and resource load chart."
HOMEPAGE="http://ganttproject.sourceforge.net/"
SRC_URI="mirror://sourceforge/ganttproject/${MY_P}.zip"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="app-arch/unzip
		virtual/jdk"
RDEPEND="virtual/jre"

S="${WORKDIR}/${MY_P}"

src_install() {
	cd "${S}"
	insinto /usr/share/${PN}
	doins -r eclipsito.jar plugins/

	newbin "${FILESDIR}/${PV%.*}-${PN}" ${PN}

	insinto /usr/share/${PN}/examples
	doins *.gan

	doicon "${S}/plugins/net.sourceforge.ganttproject_${PV%.*}.0/data/resources/icons/ganttproject.png"
	make_desktop_entry ${PN} "GanttProject" ${PN/-bin} "Java;Office;ProjectManagement"
}
