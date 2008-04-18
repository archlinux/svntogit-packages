# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=convmv
pkgver=1.12
pkgrel=1
pkgdesc="Tool for converting encodings on filesystems"
license=('GPL2')
arch=(i686 x86_64)
url="http://j3e.de/linux/convmv/"
depends=('perl')
source=(http://j3e.de/linux/convmv/$pkgname-$pkgver.tar.gz)
md5sums=('f96ca9198fc0a2192920f5baf002dfe4')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  make 
  make PREFIX=$startdir/pkg/usr install || return 1
}
