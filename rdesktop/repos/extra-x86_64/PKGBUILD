# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
pkgname=rdesktop
pkgver=1.5.0
pkgrel=2
depends=('libx11' 'openssl')
pkgdesc="rdesktop is used to connect to windows terminal servers"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        rdesktop-libx11.patch)
url="http://www.rdesktop.org/"
md5sums=('433546f60fc0f201e99307ba188369ed'
         'cebef1fdeb485c38fe9320c2f2c0e2d2')
sha1sums=('e3086bf865191eed41631813125f482e279c7f3d'
          '01e1344f9bb342b3e5930203af16240d7e2300e9')

build() {
   cd $startdir/src/$pkgname-$pkgver

   # apply (reversed) patch to prevent libx11 segfault
   patch -R -p0 < ../rdesktop-libx11.patch || return 1

   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}
