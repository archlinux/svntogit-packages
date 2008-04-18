# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: orelien <aurelien.foret@wanadoo.fr>

pkgname=httrack
pkgver=3.42
pkgrel=1
pkgdesc="HTTrack is an easy-to-use offline browser utility."
arch=('i686' 'x86_64')
url="http://www.httrack.com/"
license=('GPL')
depends=('bash' 'zlib')
source=(http://www.httrack.com/$pkgname-$pkgver.tar.gz)
md5sums=('8bb5f09ee007fe6e9875c070b57e0359')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-3.42.1
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
