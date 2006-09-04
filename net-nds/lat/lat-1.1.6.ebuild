# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2 mono

KEYWORDS="~x86"

DESCRIPTION="LDAP Administration Tool, allows you to browse LDAP-based directories and add/edit/delete entries."
HOMEPAGE="http://dev.mmgsecurity.com/projects/lat"
SRC_URI="http://dev.mmgsecurity.com/downloads/${PN}/1.1/${P}.tar.gz"
LICENSE="GPL-2"
IUSE="avahi"
SLOT="0"

RDEPEND=">=dev-lang/mono-1.1.13
		=dev-dotnet/gtk-sharp-2.8*
		=dev-dotnet/gnome-sharp-2.8*
		=dev-dotnet/glade-sharp-2.8*
		=dev-dotnet/gconf-sharp-2.8*
		=gnome-base/gnome-keyring-0.4*
		sys-apps/dbus
		avahi? ( net-dns/avahi )"
DEPEND="${RDEPEND}
		app-text/scrollkeeper
		dev-util/pkgconfig"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-service_finder_cs.patch"
}

src_compile() {
	econf \
		$(use_enable avahi) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO
}
