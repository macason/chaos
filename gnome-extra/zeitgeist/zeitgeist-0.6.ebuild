# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit versionator

DESCRIPTION="Zeitgeist is a service which logs the users's activities and events"
HOMEPAGE="https://launchpad.net/zeitgeist"
SRC_URI="http://launchpad.net/${PN}/$(get_version_component_range 1-2)/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gtk"

DEPEND="media-libs/raptor
	dev-python/rdflib[sqlite]
	dev-python/pyxdg
	dev-python/dbus-python
	dev-python/pygobject
	gtk? ( gnome-extra/zeitgeist-datahub )"
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
	# installed by zeitgeist-datahub now
	rm "${D}/usr/share/man/man1/zeitgeist-datahub.1"
}

pkg_postinst() {
	einfo "You probably want to insatll a few extra apps"
	einfo "\tgnome-extra/zeitgeist-extensions"
}