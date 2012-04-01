# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_P=${PN/-/.}-${PV}
DESCRIPTION="Python library for navigating WADL files"
HOMEPAGE="http://launchpad.net/wadllib"
SRC_URI="http://launchpad.net/${PN/-/.}/trunk/${PV}/+download/${MY_P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/lazr-uri
	dev-python/simplejson"

S=${WORKDIR}/${MY_P}
RESTRICT_PYTHON_ABIS="2.[45] 3.*"
