# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=nvidia-96xx
pkgver=96.43.05
_kernver='2.6.25-ARCH'
pkgrel=3
pkgdesc="NVIDIA legacy drivers for kernel26, 96xx branch"
arch=(i686 x86_64)
license=('custom:NVIDIA')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26>=2.6.25' 'kernel26<2.6.26' 'nvidia-96xx-utils')
conflicts=('nvidia' 'nvidia-71xx' 'nvidia-legacy')
install=nvidia-96xx.install
license=('custom')
source=(http://us.download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run
        NVIDIA_kernel-96.43.05-2290218.diff.txt)
md5sums=('575750b17f9fd19490fd999a72c7a661'
         'f2d9c8605a0f655b3c5c9b2434b9dccd')
[ "$CARCH" = "x86_64" ] && md5sums=('da37aa996073c4e813eda1be150a44d8'
                                    'f2d9c8605a0f655b3c5c9b2434b9dccd')

build()
{
  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
  
  # Any extra patches are applied in here...
  patch -Np0 -i ../NVIDIA_kernel-96.43.05-2290218.diff.txt || return 1

  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/$_kernver/build module 
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
