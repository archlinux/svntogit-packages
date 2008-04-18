# $Id$
# Contributor: Roman Kreisel <roman.kreisel@epost.de>
# Maintainer: damir <damir@archlinux.org>

pkgname=ding
pkgver=1.5
pkgrel=1
pkgdesc="A Dictionary Lookup program and EN<->DE Dictionary"
arch=("i686" "x86_64")
license=('GPL')
url="http://www-user.tu-chemnitz.de/~fri/ding"
depends=('tk' 'grep')
source=("http://wftp.tu-chemnitz.de/pub/Local/urz/$pkgname/$pkgname-$pkgver.tar.gz" \
        "$pkgname.desktop")

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/dict
  sed -i '2,4d' install.sh
  sed -i 's|ger-eng|de-en|g' install.sh
export DEFBINDIR=$startdir/pkg/usr/bin
export DEFLIBDIR=$startdir/pkg/usr/share/dict
  yes "" | ./install.sh
  cd $startdir/pkg/usr/bin
  sed -i s+$startdir/pkg++ ding

  # install some freedesktop.org compatibility
  install -D -m644 $startdir/src/$pkgname.desktop \
  $startdir/pkg/usr/share/applications/$pkgname.desktop
  install -D -m644 $startdir/src/$pkgname-$pkgver/$pkgname.png \
  $startdir/pkg/usr/share/pixmaps/$pkgname.png
}

md5sums=('74c2b3104f8732107c23c005b64d5609'
         'f8fffb55b1817317dc1df097f0ae1376')
