#Contributor: Simo Leone <neotuli@gmail.com>
pkgname=xpp
pkgver=1.5
pkgrel=2
pkgdesc="X Printing Panel"
url="http://cups.sourceforge.net/xpp"
license=""
depends=('cups' 'fltk')
makedepends=('fltk')
source=("http://download.sourceforge.net/cups/$pkgname-$pkgver.tar.bz2")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('fd539258d2b1a554f01937047d44f78e')
