# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>

pkgname=libnetfilter_conntrack
pkgver=1.0.9
pkgrel=1
pkgdesc='Library providing an API to the in-kernel connection tracking state table'
arch=('x86_64')
depends=('libnfnetlink' 'libmnl')
url='https://www.netfilter.org/projects/libnetfilter_conntrack/'
license=('GPL')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("https://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2"{,.sig})
sha256sums=('67bd9df49fe34e8b82144f6dfb93b320f384a8ea59727e92ff8d18b5f4b579a8'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


# vim:set ts=2 sw=2 et:
