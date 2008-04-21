# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-savage
pkgver=2.2.0
pkgrel=1
pkgdesc="X.org savage video driver"
mesaver="7.0.3-rc3"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libdrm>=2.3.0' 'expat>=2.0')
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90' 'imake' 'mesa>=7.0.3rc3' 'xf86driproto' 'glproto>=1.4.9')
options=(!libtool)
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        http://www.mesa3d.org/beta/MesaLib-${mesaver}.tar.gz)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --enable-dri || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/src/Mesa-${mesaver}

  cd configs
  CONFIG="linux-dri-x86"
  [ "$CARCH" = "x86_64" ] && CONFIG="linux-dri-x86-64"
  echo "EXTRA_LIB_PATH =" >> ${CONFIG}
  echo "OPT_FLAGS = ${CFLAGS} -fno-strict-aliasing" >> ${CONFIG}
  echo "SRC_DIRS = glx/x11 mesa" >> ${CONFIG}
  echo "USING_EGL = 0" >> ${CONFIG}
  echo "PROGRAM_DIRS =" >> ${CONFIG}
  echo "MKDEP = makedepend" >> ${CONFIG}
  echo "DRI_DIRS = savage" >> ${CONFIG}
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
md5sums=('0f7858b58e14dce53bcbaec2160bfcb9'
         '8caf88712f76f28ed36aa0cedad6d7cb')
