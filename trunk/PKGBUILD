# $Id$
# Maintainer: tobias <tobias@archlinux.org>

pkgname=gimp
pkgver=2.4.5
pkgrel=1
pkgdesc="GNU Image Manipulation Program"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.gimp.org/"
depends=('gtk2>=2.10' 'lcms>=1.16' 'libxpm>=3.5.6' 'libwmf>=0.2.8.4' \
         'libxmu>=1.0.3' 'librsvg>=2.16.1' 'libmng>=1.0.9' \
         'libexif>=0.6.13' 'libart-lgpl>=2.3.19' 'pygtk>=2.10.4' 'dbus-glib')
makedepends=('gutenprint>=5.0.0' 'perlxml' \
             'poppler>=0.6' 'pkgconfig>=0.21' \
             'alsa-lib>=1.0.13' 'libgnomeprintui')
options=('!libtool' '!makeflags')
conflicts=('gimp-unstable')
install=${pkgname}.install
source=(ftp://ftp.gimp.org/pub/gimp/v2.4/${pkgname}-${pkgver}.tar.bz2
        linux.gpl)
md5sums=('162e264dc5f0c7e4de8794e78818381f' 'bb27bc214261d36484093e857f015f38')

build() {
   cd ${startdir}/src/${pkgname}-${pkgver}
   ./configure --prefix=/usr --sysconfdir=/etc \
     --enable-mp --enable-gimp-console --disable-devel-docs \
     --enable-python --with-gif-compression=lzw \
     --without-aa
   make || return 1
   make DESTDIR=${startdir}/pkg install-strip
   install -Dm644 ${startdir}/src/linux.gpl \
     ${startdir}/pkg/usr/share/gimp/2.0/palettes/Linux.gpl
}
