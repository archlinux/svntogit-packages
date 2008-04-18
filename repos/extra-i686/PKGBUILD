# $Id$
# Maintainer: Travis Willard <travis@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=faad2
pkgver=2.6
pkgrel=1
pkgdesc="ISO AAC audio decoder"
arch=(i686 x86_64)
license=('custom')
url="http://www.audiocoding.com/"
depends=('glibc')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/faac/${pkgname}-${pkgver}.tar.gz LICENSE)

build() {
  cd ${startdir}/src/${pkgname}
  echo "SUBDIRS = libfaad common frontend" > Makefile.am || return 1

  echo > plugins/Makefile.am
  echo > plugins/xmms/src/Makefile.am
  sed -i '/E_B/d' configure.in
  autoreconf -vif
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -m644 ${startdir}/src/${pkgname}/common/mp4ff/mp4ff.h ${startdir}/pkg/usr/include/
  install -m644 ${startdir}/src/${pkgname}/common/mp4ff/mp4ff_int_types.h ${startdir}/pkg/usr/include/
  install -m644 ${startdir}/src/${pkgname}/common/mp4ff/.libs/*.a ${startdir}/pkg/usr/lib/

  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}
}
md5sums=('aeeb1e6c2dc70eeb7fb74afd546d8b82'
         '4d8da2d7ce23e1d5f50d3404193bb053')
