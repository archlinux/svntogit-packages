# Maintainer: Martin Lefebvre <dadexter@gmail.com>

pkgname=pebrot
pkgver=0.8.8
pkgrel=2
pkgdesc="Pebrot is a text MSN messenger client implemented with Python."
arch=(i686 x86_64)
url="http://pebrot.sourceforge.net/"
depends=('python')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz pebrot.patch)
md5sums=('773392904defc14e6264832b0d0c620d' '75618351ad7bbc0b641b986e204acd4a')


build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p2 < $startdir/pebrot.patch
  python setup.py install --root=$startdir/pkg/
  mkdir -p $startdir/pkg/etc
  cp $startdir/src/$pkgname-$pkgver/pebrotrc $startdir/pkg/etc
  mkdir -p $startdir/pkg/usr/share/pebrot
  cp logos/*.txt $startdir/pkg/usr/share/pebrot
}
