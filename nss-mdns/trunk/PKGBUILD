# Maintainer:
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Travis Willard <travis@archlinux.org>

pkgname=nss-mdns
pkgver=0.15.1
pkgrel=1
pkgdesc="glibc plugin providing host name resolution via mDNS"
arch=('x86_64')
url="http://0pointer.de/lennart/projects/nss-mdns/"
license=('LGPL')
depends=('glibc' 'avahi')
source=("https://github.com/lathiat/nss-mdns/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ddf71453d7a7cdc5921fe53ef387b24fd0c3c49f4dcf94a2a437498596761a21')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

