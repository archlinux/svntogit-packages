# $Id$
# Maintainer: Roman Kyrylych <roman@gmail.com>
# Contributor: Roman Kyrylych <roman@gmail.com>

pkgname=ftjam
pkgver=2.5.3rc2
pkgrel=1
pkgdesc='FT Jam - an enhanced version of the Jam build tool'
arch=('i686' 'x86_64')
url="http://freetype.org/jam/"
license=('custom')
depends=('glibc')
provides=('jam')
conflicts=('jam')
replaces=('jam')
#source=(http://downloads.sourceforge.net/freetype/$pkgname-$pkgver.tar.bz2 \
source=(http://david.freetype.org/jam/$pkgname-$pkgver.tar.bz2 \
        license.txt)
md5sums=('911cc4191b3e7213905d107962b4529b'
         '2addc259114b4f50a870fa04881e1200')

build(){
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../license.txt $startdir/pkg/usr/share/licenses/jam/license.txt
}
