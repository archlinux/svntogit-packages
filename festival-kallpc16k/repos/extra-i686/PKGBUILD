# $Id$
# Maintainer: Simo Leone <neuotuli@gmail.com>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=festival-kallpc16k
_pkgnameorig=festvox_kallpc16k
pkgver=1.95
pkgrel=2
pkgdesc="British English RP male speaker"
url="http://www.cstr.ed.ac.uk/projects/festival/"
license=""
depends=('festival')
source=("http://www.cstr.ed.ac.uk/downloads/festival/$pkgver/$_pkgnameorig.tar.gz")

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/festival
  mv festival/lib/voices $startdir/pkg/usr/share/festival
}
md5sums=('abbd12e1d04ecdcae07f1d0044f3a947')
