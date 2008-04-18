# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>

_kernver=2.6.19-ARCH
pkgname=at76c503a-fw-cvs
pkgver=20061223
pkgrel=1
pkgdesc="Another driver for the Atmel AT76C503A based USB WLAN adapters from latest CVS version."
url="http://developer.berlios.de/projects/at76c503a"
license="custom"
depends=('wireless_tools' 'kernel26')
provides=('at76c503a-fw')
conflicts=('at76c503a-fw')
makedepends=('cvs')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.berlios.de:/cvsroot/at76c503a"
_cvsmod="at76c503a"

build() {
  cd $startdir/src
  msg "Connecting to $_cvsmod.berlios.de CVS server..."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $_cvsmod

  msg "CVS checkout done or server timeout"
  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build/fwutils

  make || return 1

  #Install firmware
  for i in *.bin; do
    install -D -m 644 $i $startdir/pkg/lib/firmware/$i
  done

  install -D -m644 COPYRIGHT $startdir/pkg/usr/share/licenses/at76c503a/COPYRIGHT
  rm -r $startdir/src/$_cvsmod-build
}
