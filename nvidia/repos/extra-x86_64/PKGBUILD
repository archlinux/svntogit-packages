# $Id$
# Maintainer : Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia
pkgver=169.12
_kernver='2.6.24-ARCH'
pkgrel=2
pkgdesc="NVIDIA drivers for kernel26."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26>=2.6.24.3-4' 'kernel26<=2.6.25-0' 'nvidia-utils')
conflicts=('nvidia-96xx' 'nvidia-71xx' 'nvidia-legacy')
license=('custom')
install=nvidia.install
source=(http://us.download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run)
md5sums=('e7aaca79c846e34cfe8111040bfee2d0')
[ "$CARCH" = "x86_64" ] && md5sums=('843a1e8bc1923ba2e4b60f6fab31ad3b')

build()
{
  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
  
  # Any extra patches are applied in here...

  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/${_kernver}/build module 
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
