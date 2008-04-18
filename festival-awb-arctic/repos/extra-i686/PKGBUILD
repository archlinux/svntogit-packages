# $Id$
# Maintainer: Simo Leone <neotuli@gmail.com>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=festival-awb-arctic
_pkgnameorig=festvox_cstr_us_awb_arctic_multisyn
pkgver=1.0
pkgrel=1
pkgdesc="Scottish English male speaker (AWB), using excited residual LPC multisyn database."
url="http://www.cstr.ed.ac.uk/projects/festival/"
license=""
depends=('festival')
source=("http://www.cstr.ed.ac.uk/downloads/festival/1.95/$_pkgnameorig-$pkgver.tar.gz")

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/festival
  mv festival/lib/voices-multisyn $startdir/pkg/usr/share/festival
}
md5sums=('880c20efb5baf0532671b46ac28545d0')
