# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-mga
pkgver=1.4.8
pkgrel=1
pkgdesc="X.org mga video driver"
mesaver="7.0.3-rc2"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libdrm' 'expat>=2.0')
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90' 'imake' 'mesa>=7.0.3rc1' \
             'xf86driproto' 'glproto>=1.4.9')
options=('!libtool' 'force')
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
	http://www.mesa3d.org/beta/MesaLib-${mesaver}.tar.gz)
md5sums=('e7783c7609d441237d665b7fc47288c7'
         '141f5c1c89b090d0f0bd92522ebb8de9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --enable-dri || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/src/Mesa-${mesaver}/configs

  CONFIG="linux-dri-x86"
  [ "$CARCH" = "x86_64" ] && CONFIG="linux-dri-x86-64"
  echo "EXTRA_LIB_PATH =" >> ${CONFIG}
  echo "OPT_FLAGS = ${CFLAGS}" >> ${CONFIG}
  echo "SRC_DIRS = glx/x11 mesa" >> ${CONFIG}
  echo "USING_EGL = 0" >> ${CONFIG}
  echo "PROGRAM_DIRS =" >> ${CONFIG}
  echo "MKDEP = makedepend" >> ${CONFIG}
  echo "DRI_DIRS = mga" >> ${CONFIG}
  echo "DRI_DRIVER_SEARCH_DIR = /usr/lib/xorg/modules/dri" >> ${CONFIG}
  echo "DRI_DRIVER_INSTALL_DIR = /usr/lib/xorg/modules/dri" >> ${CONFIG}
  echo "ARCH_FLAGS += -DGLX_USE_TLS" >> ${CONFIG}
  echo "X11_INCLUDES = `pkg-config --cflags-only-I x11`" >> ${CONFIG}

  ln -s ${CONFIG} current
  cd ${startdir}/src/Mesa-${mesaver}/src/mesa
  make linux-solo || return 1
  cd drivers/dri
  make DESTDIR=${startdir}/pkg install || return 1
}
