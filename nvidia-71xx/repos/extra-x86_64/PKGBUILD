# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=nvidia-71xx
pkgver=71.86.04
_kernver='2.6.24-ARCH'
pkgrel=2
pkgdesc="NVIDIA legacy drivers for kernel26, 71xx branch"
arch=(i686 x86_64)
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('nvidia-71xx-utils' 'kernel26>=2.6.24.3-4' 'kernel26<=2.6.25-0')
conflicts=('nvidia' 'nvidia-96xx' 'nvidia-legacy')
replaces=('nvidia-legacy')
license=('custom')
source=(ftp://download.nvidia.com/XFree86/Linux-${ARCH}/${pkgver}/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run) 
install="nvidia-71xx.install"
md5sums=('56354473bddff67eefed22d79398fb93')
[ "$CARCH" = "x86_64" ] && md5sums=('9d102e8a6a1746423f0e0a231df63eeb')

build() {  
  cd $startdir/src 

  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-${ARCH}-${pkgver}-pkg0
  # Any extra patches are applied in here...
  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/$_kernver/build module 
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
