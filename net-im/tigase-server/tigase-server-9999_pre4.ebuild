# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"

ESVN_REPO_URI="https://svn.tigase.org/reps/${PN}/trunk"

inherit subversion java-pkg-2 eutils

DESCRIPTION="Tigase XMPP server"
HOMEPAGE="http://www.tigase.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-java/ant-1.7
	>=dev-java/tigase-xmltools-3.0
	>=dev-java/tigase-utils-3.1
	>=virtual/jdk-1.6.0"

RDEPEND=">=dev-java/tigase-xmltools-3.0
	>=dev-java/tigase-utils-3.1
	>=virtual/jre-1.6.0"

src_unpack() {
	subversion_src_unpack
	cd "${S}"
	ant clean-all

	EPATCH_OPTIONS="--ignore-whitespace"

	#Edit classpaths for ant to fit gentoo way
	epatch "${FILESDIR}/classpaths.patch"

	sed -i -e "s:libs=libs:xmltoolsjar=$(java-pkg_getjar tigase-xmltools
	tigase-xmltools.jar)\nutilsjar=$(java-pkg_getjar tigase-utils tigase-utils.jar):" \
		build.properties || die "Failed to patch build properties with correct jar locations"

	#Make default config more gentoo'ish
	epatch "${FILESDIR}/default_config.patch"
}

src_compile() {
	ant jar || die "Compile failed"
	if use doc; then
		ant docs || die "Docs failed"
	fi
}

src_install() {
	java-pkg_dojar jars/*.jar

	use doc && java-pkg_dojavadoc docs/api
	use source && java-pkg_dosrc src/main/java/

	newconfd "${FILESDIR}/conf_d_tigase" tigase || die "newconfd failed"
	newinitd "${FILESDIR}/init_d_tigase" tigase || die "newinitd failed"

	insinto /etc
	doins "${FILESDIR}/tigase.properties" || die "doins failed"

	insinto /var/lib/tigase/certificates
	insopts -m0600
	doins certs/* || die "doins failed"

	dodir /var/log/tigase
	touch "${D}/var/log/tigase/tigase.log"
}

pkg_preinst() {
	enewgroup tigase
	enewuser tigase -1 -1 /dev/null tigase

	fowners -R tigase:tigase /var/lib/tigase
	fowners -R tigase:tigase /var/log/tigase
}

pkg_postinst() {
	einfo "Remember to change config file and conf.d file to your needs."
	einfo "Config file is default generated by server is not present."
	einfo
}
