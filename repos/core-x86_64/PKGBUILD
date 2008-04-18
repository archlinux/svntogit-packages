# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=tar
pkgver=1.19
pkgrel=2
pkgdesc="Utility used to store, backup, and transport files"
arch=(i686 x86_64)
license=('GPL')
groups=('base')
url="http://www.gnu.org/software/tar/tar.html"
depends=('glibc' 'bash')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.bz2 tar.1)
md5sums=('bcc2e19b19823b9ab68c94586067a792'
         'a5f8c5da7a9465ea1978145f3ef0610c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/tar --bindir=/bin
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../tar.1 $startdir/pkg/usr/man/man1/tar.1
}
