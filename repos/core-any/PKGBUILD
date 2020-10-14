# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thomas Mudrunka <harvie@email.cz>
# Contributor: m4xm4n <max@maxfierke.com>

pkgname=dnssec-anchors
pkgver=20190629
_trusted_key=trusted-key-${pkgver}.key
pkgrel=3
pkgdesc='DNSSEC trust anchors for the root zone'
url='https://data.iana.org/root-anchors/'
license=('custom:none')
arch=('any')
makedepends=('unbound')
source=('LICENSE' "https://sources.archlinux.org/other/packages/${pkgname}/${_trusted_key}")
sha256sums=('dd37e92942d5a4024f1c77df49d61ca77fc6284691814903a741785df61f78cb'
            'b01933ede7d505cac6bbee8c58027057d3a073581fa6cf595c352553dd07ee3c')

package() {
	cd "${srcdir}"
	install -Dm644 ${_trusted_key} "${pkgdir}"/etc/trusted-key.key
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
