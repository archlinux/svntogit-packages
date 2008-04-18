# $Id$
# Maintainer: Simo Leone <neotuli@gmail.com>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=festival-don
_pkgnameorig=festvox_don
pkgver=1.95
pkgrel=1
pkgdesc="British English RP male speaker using using spike excited LPC diphone database"
url="http://www.cstr.ed.ac.uk/projects/festival/"
license=""
depends=('festival')
source=("http://www.cstr.ed.ac.uk/downloads/festival/$pkgver/$_pkgnameorig.tar.gz")

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/festival
  mv festival/lib/voices $startdir/pkg/usr/share/festival
}
md5sums=('90442079e34a3a694077f8715d15fbdf')
