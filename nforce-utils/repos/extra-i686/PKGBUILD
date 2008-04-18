# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>


pkgname=nforce-utils
pkgver=1.0.0310
_nver=1.0-0310
pkgrel=1
pkgdesc="The Nvidia nforce utilities"
arch=(i686 x86_64)
url="http://www.nvidia.com"
depends=()
source=(ftp://download.nvidia.com/XFree86/nforce/${_nver}/NFORCE-Linux-x86-${_nver}-pkg1.run)
install="nforce.install"
build() {  
cd $startdir/src/
  # Extract
  cd $startdir/src/
  sh NFORCE-Linux-x86-${_nver}-pkg1.run --extract-only
  cd NFORCE-Linux-x86-${_nver}-pkg1

  mkdir -p $startdir/pkg/usr/{lib,bin}
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/nforce/LICENSE
  install -D -m755 nvsound/nvmix-reg $startdir/pkg/usr/bin/nvmix-reg 
  install -D -m755 nvsound/nvmixer $startdir/pkg/usr/bin/nvmixer
  install -D -m644 nvsound/lib/libnvalut.a  $startdir/pkg/usr/lib/libnvalut.a
  install -D -m644 nvsound/lib/libnvopenal.a $startdir/pkg/usr/lib/libnvopenal.a
 }
md5sums=('9e0b636ff53f4f23768383af962cc68c')
