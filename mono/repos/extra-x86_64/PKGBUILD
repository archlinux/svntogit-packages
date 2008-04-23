# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono
pkgver=1.9.1
pkgrel=1
pkgdesc="Free implementation of the .NET platform including runtime and compiler"
arch=(i686 x86_64)
license=('GPL' 'LGPL2' 'MPL' 'custom:MITX11')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus>=1.9')
makedepends=('pkgconfig')
options=('!libtool' '!makeflags')
source=(http://www.go-mono.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        mono.rc.d)
md5sums=('6610c3b999d791553a9dc21059ca9d35'
         '8315e46c6a6e9625502521fc0ad1a322')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${startdir}/src/weird
  mkdir -p "${MONO_SHARED_DIR}"
  mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname
  # build mono
  cd ${startdir}/src/${pkgname}-${pkgver}
  rm -f libgc/libtool.m4
  autoreconf --force --install
  autoreconf --force --install libgc
  ./configure --prefix=/usr --sysconfdir=/etc \
              --with-libgdiplus=installed --with-icu=no \
              --with-tls=pthread --with-jit=yes --with-preview=yes \
              --with-sigaltstack=yes --enable-nunit-tests \
	      --with-moonlight=yes
  make || return 1
  sed -i "/NO_INSTALL = yes/d" mcs/nunit20/nunit-console/Makefile
  make DESTDIR=${startdir}/pkg install

  # install daemons and pathes
  mkdir -p ${startdir}/pkg/etc/rc.d
  install -m755 ${startdir}/src/mono.rc.d $startdir/pkg/etc/rc.d/mono

  #install license
  install -m644 mcs/MIT.X11 ${startdir}/pkg/usr/share/licenses/$pkgname/
}
