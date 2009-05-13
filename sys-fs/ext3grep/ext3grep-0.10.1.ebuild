# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base

DESCRIPTION="recover deleted files on an ext3 file system"
HOMEPAGE="http://www.xs4all.nl/~carlo17/howto/undelete_ext3.html"
SRC_URI="http://ext3grep.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug largefile libcwd pch"
RDEPEND=""
DEPEND="${RDEPEND}
	debug? ( libcwd? ( dev-cpp/libcwd ) )"

PATCHES=( "${FILESDIR}"/gcc-4.3.patch )

src_compile() {
	local myconf

	use debug && myconf="--disable-optimize"

	econf ${myconf} \
		$(use_enable libcwd) \
		$(use_enable debug) \
		$(use_enable pch) \
		$(use_enable largefile)

	emake || die "emake failed"
}


src_install() {
	emake DESTDIR="${D}" install || die

	dodoc NEWS README || die
}
