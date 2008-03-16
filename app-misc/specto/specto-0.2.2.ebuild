# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PYTHON_MODNAME="spectlib"
inherit distutils

DESCRIPTION="A desktop application to watch configurable events (such as website updates, emails,
file and folder changes, system processes, etc) and then trigger notifications."
HOMEPAGE="http://specto.sourceforge.net/"
SRC_URI="http://specto.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LANGS="cs de es fr it pt_BR ro sv tr"
for i in ${LANGS} ; do
	IUSE="${IUSE} linguas_${i}"
done

DEPEND="dev-python/dbus-python
	dev-python/gnome-python
	dev-python/gnome-python-extras
	dev-python/notify-python
	>=dev-python/pygtk-2.10"

src_install() {
	distutils_src_install
	dodoc data/doc/{AUTHORS,ChangeLog}
	rm -rf "${D}"/usr/share/doc/${PN}
	for i in ${LANGS} ; do
		use linguas_${i} || rm -rf "${D}"/usr/share/locale/${i}
	done
}
