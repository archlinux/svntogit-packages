# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-tdfx
pkgver=1.4.0
pkgrel=1
pkgdesc="X.org tdfx video driver"
_mesaver="7.0.3"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('expat>=2.0' 'libdrm>=2.3.0')
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90' 'imake' 'mesa>=7.0.3')
options=(!libtool)
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        http://downloads.sourceforge.net/sourceforge/mesa3d/MesaLib-${_mesaver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --enable-dri || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/src/Mesa-${_mesaver}
  cd configs

  CONFIG="linux-dri-x86"
  [ "$CARCH" = "x86_64" ] && CONFIG="linux-dri-x86-64"
  echo "EXTRA_LIB_PATH =" >> ${CONFIG}
  echo "OPT_FLAGS = ${CFLAGS} -fno-strict-aliasing" >> ${CONFIG}
  echo "SRC_DIRS = glx/x11 mesa" >> ${CONFIG}
  echo "USING_EGL = 0" >> ${CONFIG}
  echo "PROGRAM_DIRS =" >> ${CONFIG}
  echo "MKDEP = makedepend" >> ${CONFIG}
  echo "DRI_DIRS = tdfx" >> ${CONFIG}
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
md5sums=('b13132f24683ef759bfb0c1db5096496'
         'e6e6379d7793af40a6bc3ce1bace572e')
