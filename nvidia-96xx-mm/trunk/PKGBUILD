# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=nvidia-96xx-mm
pkgver=1.0.9631
_nver=1.0-9631
_kernver='2.6.21-mm'
pkgrel=1
pkgdesc="NVIDIA legacy drivers for kernel26mm, 96xx branch"
arch=(i686 x86_64)
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26mm' 'nvidia-96xx-utils')
conflicts=('nvidia' 'nvidia-71xx' 'nvidia-legacy')
install=nvidia-96xx.install
source=(http://us.download.nvidia.com/XFree86/Linux-$ARCH/${_nver}/NVIDIA-Linux-$ARCH-${_nver}-pkg0.run)
md5sums=('b0d721c962c4df1a028ae18416d7e862')
[ "$CARCH" = "x86_64" ] && md5sums=('6fd14366f7ff4575dcce3a9d350d1355')

build()
{
  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-$ARCH-${_nver}-pkg0.run --extract-only
  cd NVIDIA-Linux-$ARCH-${_nver}-pkg0
  
  # Any extra patches are applied in here...

  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/$_kernver/build module 
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
