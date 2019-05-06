# Contributor: Thomas Bächler <thomas@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=iana-etc
pkgver=20190504
pkgrel=1
pkgdesc='/etc/protocols and /etc/services provided by IANA'
url='https://www.iana.org/protocols'
arch=('any')
license=('custom:none')
backup=('etc/'{protocols,services})
source=('https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml'
        'https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml'
        'LICENSE')
sha256sums=('d1ce8e3d7402802d4d2ccd38526a6967f481c226bb588529afe7e18be3b1e3d9'
            '4992fbc5453d0feb48492e6abda96bf9285ff4d2516f6924a0f92f773dc4cea2'
            'dd37e92942d5a4024f1c77df49d61ca77fc6284691814903a741785df61f78cb')

# Please note that upstream silently updates those files in place every so
# often, which causes checksum mismatch. Report this by flagging the package as
# out-of-date. Cheers.

pkgver() {
	cd "${srcdir}"
	awk -F"[<>]" '/updated/{print$3;nextfile}' * |
	sort -n | tail -n 1 | tr -d -
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/etc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/iana-etc/LICENSE"
	install -Dm644 protocol-numbers.xml "${pkgdir}/usr/share/iana-etc/protocol-numbers.iana"
	install -Dm644 service-names-port-numbers.xml "${pkgdir}/usr/share/iana-etc/port-numbers.iana"

	gawk -F"[<>]" '
BEGIN { print "# Full data: /usr/share/iana-etc/protocol-numbers.iana\n" }
(/<record/) { v=n="" }
(/<value/) { v=$3 }
(/<name/ && $3!~/ /) { n=$3 }
(/<\/record/ && n && v!="") { printf "%-12s %3i %s\n", tolower(n),v,n }
' protocol-numbers.xml > "${pkgdir}/etc/protocols"

	gawk -F"[<>]" '
BEGIN { print "# Full data: /usr/share/iana-etc/port-numbers.iana\n" }
(/<record/) { n=u=p=c="" }
(/<name/ && !/\(/) { n=$3 }
(/<number/) { u=$3 }
(/<protocol/) { p=$3 }
(/Unassigned/ || /Reserved/ || /historic/) { c=1 }
(/<\/record/ && n && u && p && !c) { printf "%-15s %5i/%s\n", n,u,p }
' service-names-port-numbers.xml > "${pkgdir}/etc/services"

}
