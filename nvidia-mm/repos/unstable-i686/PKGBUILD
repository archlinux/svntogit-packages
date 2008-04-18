# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=nvidia-mm
pkgver=100.14.11
_kernver='2.6.23-mm'
pkgrel=1
pkgdesc="NVIDIA drivers for kernel26mm."
arch=(i686 x86_64)
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26mm' 'nvidia-utils')
install=nvidia.install
source=(http://us.download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run
	kernel-2.6.23-rc1.patch)
md5sums=('af434d27f9b089ac1cb216f55f9b0f33'
         '33ec1f6734ed50277eaa314505706241')
[ "$CARCH" = "x86_64" ] && md5sums=('e87b354355cce583646004dbfea1f09a'
			            '33ec1f6734ed50277eaa314505706241')

build()
{
  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
  
  # Any extra patches are applied in here...
  patch -Np1 -i ../kernel-2.6.23-rc1.patch || return 1

  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/${_kernver}/build module || return 1
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
