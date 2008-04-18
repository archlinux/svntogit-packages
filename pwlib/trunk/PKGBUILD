# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: Tom K <tomk@runbox.com>

pkgname=pwlib
pkgver=1.10.10
pkgrel=2
pkgdesc="Portable Windows Library"
arch=(i686 x86_64)
url="http://www.ekiga.org/"
license=('GPL')
depends=('libldap' 'sdl>=1.2.10' 'alsa-lib>=1.0.11' 'libavc1394>=0.5.1' 'libdc1394' 'libdv')
makedepends=('gcc>=4.2.1')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/1.10/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2c3bf7e8236a96659728ad139ce30b33')

build() {
  cd ${startdir}/src/pwlib-${pkgver}
  sed 's|lib64|lib|' -i configure
  sed 's|bits/atomicity.h|ext/atomicity.h|g' -i configure
  ./configure --prefix=/usr --libdir=/usr/lib \
              --sysconfdir=/etc --localstatedir=/var \
  	      --enable-opal --enable-plugins \
	      --enable-oss --enable-v4l2 \
	      --enable-avc --enable-sdl \
	      --enable-ipv6 --enable-v4l \
	      --enable-dc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
