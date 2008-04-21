# $Id$
# Maintainer: Alexander Baldeck <kth5@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libgl
pkgver=7.0.3rc2
_mesaver=7.0.3-rc2
pkgrel=1
pkgdesc="Mesa DRI OpenGL library and drivers"
arch=(i686 x86_64)
license=('LGPL')
url="http://mesa3d.sourceforge.net"
depends=('libxxf86vm' 'libdrm>=2.3' 'libxfixes' 'libxdamage')
makedepends=('imake' 'glproto>=1.4.9' 'fixesproto' 'damageproto' 'pkgconfig')
provides=('libgl-dri')
replaces=('libgl-dri' 'libgl-mesa')
source=(http://www.mesa3d.org/beta/MesaLib-${_mesaver}.tar.gz)
md5sums=('141f5c1c89b090d0f0bd92522ebb8de9')

build() {
  cd ${startdir}/src/Mesa-${_mesaver}

  CONFIG="linux-dri-x86"
  if [ "${CARCH}" = "x86_64" ]; then
    CONFIG="linux-dri-x86-64"
    sed -i -e "s/lib64/lib/g" ${startdir}/src/Mesa-${_mesaver}/configs/${CONFIG}
  fi

  echo "EXTRA_LIB_PATH =" >> configs/${CONFIG}
  echo "OPT_FLAGS = ${CFLAGS}" >> configs/${CONFIG}
  echo "SRC_DIRS = glx/x11 mesa" >> configs/${CONFIG}
  rm -f include/GL/glut*h
  echo "USING_EGL = 0" >> configs/${CONFIG}
  echo "PROGRAM_DIRS =" >> configs/${CONFIG}
  echo "MKDEP = makedepend" >> configs/${CONFIG}
  echo "DRI_DIRS =" >> configs/${CONFIG}
  echo "DRI_DRIVER_SEARCH_DIR = /usr/lib/xorg/modules/dri" >> configs/${CONFIG}
  echo "ARCH_FLAGS += -DGLX_USE_TLS" >> configs/${CONFIG}
  echo "X11_INCLUDES = `pkg-config --cflags-only-I x11`" >> configs/${CONFIG}

  make ${CONFIG} || return 1
  install -m755 -d ${startdir}/pkg/usr
  make INSTALL_DIR=${startdir}/pkg/usr install || return 1

  rm -rf ${startdir}/pkg/usr/include

  install -m755 -d ${startdir}/pkg/usr/lib/xorg/modules/extensions || return 1
  cd ${startdir}/pkg/usr/lib/xorg/modules/extensions || return 1
  ln -sf libGLcore.xorg libGLcore.so
  ln -sf libglx.xorg libglx.so
}
