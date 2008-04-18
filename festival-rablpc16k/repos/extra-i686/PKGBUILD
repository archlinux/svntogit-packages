# $Id$
# Maintainer: Simo Leone <neotuli@gmail.com>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=festival-rablpc16k
_pkgnameorig=festvox_rablpc16k
pkgver=1.95
pkgrel=1
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
md5sums=('cefcdda6cd48027da36d78f2f711451b')
