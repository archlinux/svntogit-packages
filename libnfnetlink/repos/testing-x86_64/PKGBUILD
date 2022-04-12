# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
# Contributor: Filip Wojciechowski, filip at loka dot pl

pkgname=libnfnetlink
pkgver=1.0.2
pkgrel=1
pkgdesc='Low-level library for netfilter related kernel/userspace communication'
arch=('x86_64')
url='https://www.netfilter.org/projects/libnfnetlink/'
license=('GPL')
depends=('glibc')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("https://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2"{,.sig})
sha256sums=('b064c7c3d426efb4786e60a8e6859b82ee2f2c5e49ffeea640cfe4fe33cbc376'
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
