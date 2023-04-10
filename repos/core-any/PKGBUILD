# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=iana-etc
pkgver=20230405
_ports=service-names-port-numbers-${pkgver}
_protocols=protocol-numbers-20230316
pkgrel=1
pkgdesc='/etc/protocols and /etc/services provided by IANA'
url='https://www.iana.org/protocols'
arch=('any')
license=('custom:none')
backup=('etc/'{protocols,services})
source=("https://sources.archlinux.org/other/packages/iana-etc/${_ports}.xml"
        "https://sources.archlinux.org/other/packages/iana-etc/${_protocols}.xml"
        'LICENSE')
sha256sums=('1f633a11b2f9d1b81f22885cb8b43eb80edc4893a2ef77c1fe16bf738adebe95'
            '99d939412debbd69e49ad198f4c08b6d512b9e8f2f83e8f69be77da93aba1a24'
            'dd37e92942d5a4024f1c77df49d61ca77fc6284691814903a741785df61f78cb')

# Original but unversioned IANA files:
# https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml
# https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml

package() {
	cd "${srcdir}"

	install -d "${pkgdir}/etc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/iana-etc/LICENSE"
	install -Dm644 ${_ports}.xml "${pkgdir}/usr/share/iana-etc/port-numbers.iana"
	install -Dm644 ${_protocols}.xml "${pkgdir}/usr/share/iana-etc/protocol-numbers.iana"

	gawk -F"[<>]" '
BEGIN { print "# Full data: /usr/share/iana-etc/protocol-numbers.iana\n" }
(/<record/) { v=n="" }
(/<value/) { v=$3 }
(/<name/ && $3!~/ /) { n=$3 }
(/<\/record/ && n && v!="") { printf "%-12s %3i %s\n", tolower(n),v,n }
' ${_protocols}.xml > "${pkgdir}/etc/protocols"

	gawk -F"[<>]" '
BEGIN { print "# Full data: /usr/share/iana-etc/port-numbers.iana\n" }
(/<record/) { n=u=p=c="" }
(/<name/ && !/\(/) { n=$3 }
(/<number/) { u=$3 }
(/<protocol/) { p=$3 }
(/Unassigned/ || /Reserved/ || /historic/) { c=1 }
(/<\/record/ && n && u && p && !c) { printf "%-15s %5i/%s\n", n,u,p }
' ${_ports}.xml > "${pkgdir}/etc/services"

}
