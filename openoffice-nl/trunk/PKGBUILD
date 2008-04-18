# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=openoffice-nl
pkgver=2.4.0
pkgrel=1
pkgdesc="OpenOffice dutch language files"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.openoffice.org"
makedepends=('rpmextract')
depends=('openoffice-base')
source=(ftp://ftp-1.gwdg.de/pub/openoffice/extended/2.4.0rc6/OOo_2.4.0rc6_20080314_LinuxIntel_langpack_nl.tar.gz)
md5sums=('71c4ae2385ee4d57e1b3884fe60258f9')

build() {
  cd $startdir/src/OOH680_m12_native_packed-1_nl.9286/RPMS
  for i in *.rpm
  do rpmextract.sh $i
  done
  # install openoffice language files
  cd $startdir/src/OOH680_m12_native_packed-1_nl.9286/RPMS/opt
  mkdir -p $startdir/pkg/opt
  mv openoffice.org2.4 $startdir/pkg/opt/openoffice
  chown root -R $startdir/pkg/opt/openoffice
  chgrp root -R $startdir/pkg/opt/openoffice
}
