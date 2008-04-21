# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=xf86-video-intel
pkgver=2.2.1
pkgrel=4
_mesaver=7.0.3
pkgdesc="X.org Intel i810/i830/i915 video drivers"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libdrm>=2.3.0' 'expat>=2.0')
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90' 'imake' 'xf86driproto'
             'libxvmc' 'mesa>=7.0.3')
options=('!libtool')
groups=('xorg-video-drivers')
conflicts=('xf86-video-i810')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        http://downloads.sourceforge.net/sourceforge/mesa3d/MesaLib-${_mesaver}.tar.bz2
	01_fix_compiz_video.diff
	03_dell_1535_quirk.diff
	04_dell_1735_quirk.diff
	05_intel_exa_force_greedy.patch
	08_945gm_quirk.diff
	10_hw_overlay.diff)

build() {
  export CFLAGS="${CLFAGS} -fno-strict-aliasing"
      
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/01_fix_compiz_video.diff || return 1
  patch -Np1 -i ${startdir}/src/03_dell_1535_quirk.diff || return 1
  patch -Np1 -i ${startdir}/src/04_dell_1735_quirk.diff || return 1
  patch -Np1 -i ${startdir}/src/05_intel_exa_force_greedy.patch || return 1
  patch -Np1 -i ${startdir}/src/08_945gm_quirk.diff || return 1
  patch -Np1 -i ${startdir}/src/10_hw_overlay.diff || return 1

  ./configure --prefix=/usr \
              --enable-dri
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1


  cd ${startdir}/src/Mesa-${_mesaver}
  cd configs

  CONFIG="linux-dri-x86"
  [ "$CARCH" = "x86_64" ] && CONFIG="linux-dri-x86-64"
  echo "EXTRA_LIB_PATH =" >> ${CONFIG}
  echo "OPT_FLAGS = ${CFLAGS}" >> ${CONFIG}
  echo "SRC_DIRS = glx/x11 mesa" >> ${CONFIG}
  echo "USING_EGL = 0" >> ${CONFIG}
  echo "PROGRAM_DIRS =" >> ${CONFIG}
  echo "MKDEP = makedepend" >> ${CONFIG}
  echo "DRI_DIRS = i810 i915 i915tex i965" >> ${CONFIG}
  echo "DRI_DRIVER_SEARCH_DIR = /usr/lib/xorg/modules/dri" >> ${CONFIG}
  echo "DRI_DRIVER_INSTALL_DIR = /usr/lib/xorg/modules/dri" >> ${CONFIG}
  echo "ARCH_FLAGS += -DGLX_USE_TLS" >> ${CONFIG}
  echo "X11_INCLUDES = `pkg-config --cflags-only-I x11`" >> ${CONFIG}

  ln -s ${CONFIG} current
  cd ${startdir}/src/Mesa-${_mesaver}/src/mesa
  make linux-solo || return 1
  cd drivers/dri
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('3334dc5142871b78fc609fd1b3dac3f2'
         'e6e6379d7793af40a6bc3ce1bace572e'
         '67c0e2e7d7d5666c584ef9e2c72e48db'
         'c11277be9520840785fb8604d6cd2b57'
         '4b231516fe9d04e1332c6c85d6a4672a'
         '5f6a966d3ab4b1ae9009e9601e7ce9fa'
         '9ac8addd03f4ddc7446d3e3b58b38314'
         '50f8c51b82f4ed86e956b7b04775e15a')
