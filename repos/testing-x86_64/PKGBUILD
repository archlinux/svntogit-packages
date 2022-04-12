# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Christian Hesse <mail@earthworm.de>

pkgname=libmnl
pkgver=1.0.5
pkgrel=1
pkgdesc='Minimalistic user-space library oriented to Netlink developers.'
arch=('x86_64')
url='https://www.netfilter.org/projects/libmnl/'
license=('LGPL2.1')
depends=('glibc')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("https://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2"{,.sig})
sha256sums=('274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
