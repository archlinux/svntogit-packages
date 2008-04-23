# Maintainer: Travis Willard <travisw@wmpub.ca> 
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Nicolai Lissner <nlissne@linux01.gwdg.de>

pkgname=dvdauthor
pkgver=0.6.14
pkgrel=2
pkgdesc="DVD authoring tools"
arch=('i686' 'x86_64')
url="http://dvdauthor.sourceforge.net/"
license=('GPL')
depends=('libdvdread' 'fribidi' 'imagemagick>=6.4.0.2')
source=(http://dl.sourceforge.net/sourceforge/dvdauthor/${pkgname}-${pkgver}.tar.gz)
md5sums=('bd646b47950c4091ffd781d43fd2c5e9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
