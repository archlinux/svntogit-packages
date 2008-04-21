# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mesa
pkgver=7.0.3rc3
_mesaver=7.0.3-rc3
pkgrel=1
pkgdesc="Mesa OpenGL library"
arch=(i686 x86_64)
license=('LGPL')
url="http://mesa3d.sourceforge.net"
depends=('libgl' 'glproto>=1.4.9' 'gcc-libs' 'libxt')
makedepends=('imake' 'pkgconfig')
conflicts=('mesa-apps')
replaces=('mesa-apps')
source=(http://www.mesa3d.org/beta/MesaLib-${_mesaver}.tar.gz
	http://www.mesa3d.org/beta/MesaDemos-${_mesaver}.tar.gz
	ftp://ftp.archlinux.org/other/mesa/gl-manpages-1.0.1.tar.bz2
	mesa-6.5-apps-noglut.patch)

build() {
  cd ${startdir}/src/Mesa-${_mesaver}
  patch -Np0 -i ${startdir}/src/mesa-6.5-apps-noglut.patch || return 1

  CONFIG="linux-dri-x86"
  if [ "${CARCH}" = "x86_64" ]; then
    CONFIG="linux-dri-x86-64"
    sed -i -e "s/lib64/lib/g" ${startdir}/src/Mesa-${_mesaver}/configs/${CONFIG}
  fi
  echo "EXTRA_LIB_PATH =" >> configs/${CONFIG}
  echo "OPT_FLAGS = ${CFLAGS}" >> configs/${CONFIG}
  echo "SRC_DIRS = glx/x11 glu glw" >> configs/${CONFIG}
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
  install -m644 include/GL/*.h ${startdir}/pkg/usr/include/GL/ || return 1

  rm -f ${startdir}/pkg/usr/lib/libGL.so*
  cd progs/xdemos
  make CFLAGS+="-I${startdir}/pkg/usr/include" glxinfo glxgears || return 1
  install -m755 -d ${startdir}/pkg/usr/bin || return 1
  install -m755 glxinfo glxgears ${startdir}/pkg/usr/bin/ || return 1

  cd ${startdir}/src/gl-manpages-1.0.1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('8caf88712f76f28ed36aa0cedad6d7cb'
         '60855ec39300ba5f4cf56410a5eacaf4'
         '6ae05158e678f4594343f32c2ca50515'
         'cc5a4ea4ea8de4425997fcda2a9d8648')
