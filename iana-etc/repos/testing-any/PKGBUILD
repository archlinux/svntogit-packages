# Contributor: Thomas Bächler <thomas@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=iana-etc
pkgver=20191122
pkgrel=1
pkgdesc='/etc/protocols and /etc/services provided by IANA'
url='https://www.iana.org/protocols'
arch=('any')
license=('custom:none')
backup=('etc/'{protocols,services})
source=("https://sources.archlinux.org/other/packages/iana-etc/service-names-port-numbers-${pkgver}.xml"
        "https://sources.archlinux.org/other/packages/iana-etc/protocol-numbers-${pkgver}.xml"
        'LICENSE')
sha256sums=('2535270891e99febb368bf66c0e99550523db8123411652a33a77a94db9b6cd9'
            '4992fbc5453d0feb48492e6abda96bf9285ff4d2516f6924a0f92f773dc4cea2'
            'dd37e92942d5a4024f1c77df49d61ca77fc6284691814903a741785df61f78cb')

# Original but unversioned IANA files:
# https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml
# https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml

package() {
	cd "${srcdir}"

	_ports="service-names-port-numbers-${pkgver}.xml"
	_protocols="protocol-numbers-${pkgver}.xml"

	install -d "${pkgdir}/etc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/iana-etc/LICENSE"
	install -Dm644 ${_ports} "${pkgdir}/usr/share/iana-etc/port-numbers.iana"
	install -Dm644 ${_protocols} "${pkgdir}/usr/share/iana-etc/protocol-numbers.iana"

	gawk -F"[<>]" '
BEGIN { print "# Full data: /usr/share/iana-etc/protocol-numbers.iana\n" }
(/<record/) { v=n="" }
(/<value/) { v=$3 }
(/<name/ && $3!~/ /) { n=$3 }
(/<\/record/ && n && v!="") { printf "%-12s %3i %s\n", tolower(n),v,n }
' ${_protocols} > "${pkgdir}/etc/protocols"

	gawk -F"[<>]" '
BEGIN { print "# Full data: /usr/share/iana-etc/port-numbers.iana\n" }
(/<record/) { n=u=p=c="" }
(/<name/ && !/\(/) { n=$3 }
(/<number/) { u=$3 }
(/<protocol/) { p=$3 }
(/Unassigned/ || /Reserved/ || /historic/) { c=1 }
(/<\/record/ && n && u && p && !c) { printf "%-15s %5i/%s\n", n,u,p }
' ${_ports} > "${pkgdir}/etc/services"

}
