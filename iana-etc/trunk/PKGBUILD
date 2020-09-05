# Contributor: Thomas Bächler <thomas@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=iana-etc
pkgver=20200905
_ports=service-names-port-numbers-${pkgver}
_protocols=protocol-numbers-20200417
pkgrel=1
pkgdesc='/etc/protocols and /etc/services provided by IANA'
url='https://www.iana.org/protocols'
arch=('any')
license=('custom:none')
backup=('etc/'{protocols,services})
source=("https://sources.archlinux.org/other/packages/iana-etc/${_ports}.xml"
        "https://sources.archlinux.org/other/packages/iana-etc/${_protocols}.xml"
        'LICENSE')
sha256sums=('2c619d8727eaa56afa113b3135103366c3a09a71bc73db867fe1b84e5fffec12'
            '7de8f70197974b5238edd5a5a318392d7c262147c7495b7fb64f66b9966d4ec8'
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
