# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca> 
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=devilspie
pkgver=0.22
pkgrel=1
pkgdesc="x11 window matching utility"
arch=('i686' 'x86_64')
url="http://www.burtonini.com/blog/computers/devilspie"
license=('GPL')
depends=('libwnck>=2.20.0')
makedepends=('perlxml' 'pkgconfig')
source=("http://www.burtonini.com/computing/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  # Make and install blank config
  mkdir -p $startdir/pkg/etc/devilspie
  echo '(debug)' > $startdir/pkg/etc/devilspie/example.ds
}

md5sums=('4190e12f99ab92c0427e457d9fbfe231')
