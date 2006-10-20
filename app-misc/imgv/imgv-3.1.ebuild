# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python eutils

MY_P="${P}-src"

DESCRIPTION="imgv is a unique and feature rich image viewer using Python"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
HOMEPAGE="http://imgv.sourceforge.net/"
SLOT=0
LICENSE=GPL-2
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/pygtk
	dev-python/pygame
	dev-python/imaging"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

src_install() {
	python_version
	INST_DIR="/usr/lib/python${PYVER}/site-packages/${PN}"

	insinto ${INST_DIR}
	cd ${S}
	doins -r *.py
	insinto ${INST_DIR}/data
	cd ${S}/data
	doins -r *

	cd ${S}
	echo "IMGV_HOME=${INST_DIR}" >> 90imgv
	insinto /etc/env.d
	doins 90imgv

	make_wrapper imgv "/usr/bin/python ${INST_DIR}/imgv.py"
}

pkg_postinst() {
	python_version
	python_mod_optimize /usr/lib/python${PYVER}/site-packages/${PN}
}

pkg_postrm() {
	python_version
	python_mod_cleanup /usr/lib/python${PYVER}/site-packages/${PN}

}
