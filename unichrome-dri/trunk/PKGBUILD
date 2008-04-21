# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=unichrome-dri
pkgver=7.0.3rc3
_mesaver=7.0.3-rc3
pkgrel=1
pkgdesc="DRI drivers for Unichrome-based videochipsets"
arch=(i686 x86_64)
license=('GPL')
url="http://xorg.freedesktop.org/"
depends=('libdrm>=2.3.0' 'expat>=2.0')
makedepends=('imake' 'mesa>=7.0.3rc3' 'glproto>=1.4.9')
options=('!libtool')
source=(http://www.mesa3d.org/beta/MesaLib-${_mesaver}.tar.gz)

build() {
  cd ${startdir}/src/Mesa-${_mesaver}/configs

  CONFIG="linux-dri-x86"
  [ "$CARCH" = "x86_64" ] && CONFIG="linux-dri-x86-64"
  echo "EXTRA_LIB_PATH =" >> ${CONFIG}
  echo "OPT_FLAGS = ${CFLAGS} -fno-strict-aliasing" >> ${CONFIG}
  echo "SRC_DIRS = glx/x11 mesa" >> ${CONFIG}
  echo "USING_EGL = 0" >> ${CONFIG}
  echo "PROGRAM_DIRS =" >> ${CONFIG}
  echo "MKDEP = makedepend" >> ${CONFIG}
  echo "DRI_DIRS = unichrome" >> ${CONFIG}
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
md5sums=('8caf88712f76f28ed36aa0cedad6d7cb')
