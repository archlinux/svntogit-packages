# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Woody Gilk <woody@archlinux.org>

pkgname=gimp-devel
pkgver=2.5.0
pkgrel=1
pkgdesc="GNU Image Manipulation Program (Development Version)"
arch=('i686' 'x86_64')
url="http://www.gimp.org/"
license=('GPL')
depends=('gtk2>=2.10' 'lcms>=1.16' 'libxpm>=3.5.6' 'libwmf>=0.2.8.4' \
         'libxmu>=1.0.3' 'librsvg>=2.16.1' 'libmng>=1.0.9' 'desktop-file-utils' \
         'libexif>=0.6.13' 'libart-lgpl>=2.3.19' 'pygtk>=2.10.4' 'dbus-glib' 'gegl' )
makedepends=('gutenprint>=5.0.0' 'intltool>=0.35.5' 'libgtkhtml>=2.6.3' \
             'gnome-python>=2.16.2' 'poppler>=0.6' 'pkgconfig>=0.21' \
             'libgnomeprintui>=2.18' 'alsa-lib>=1.0.13')
options=('!libtool' '!makeflags')
conflicts=('gimp')
provides=("gimp=${pkgver}")
install=${pkgname}.install
source=(ftp://ftp.gimp.org/pub/gimp/v${pkgver%.*}/gimp-${pkgver}.tar.bz2 linux.gpl)
md5sums=('8ba5d24c700b495e8a9f32743369c925' 'bb27bc214261d36484093e857f015f38')
sha1sums=('594bcc03b201b709cb86a0d18fa79d1737855f81' '110ce9798173b19a662d086ed7b882b4729f06cf')

build() {
  cd ${startdir}/src/gimp-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-mp --enable-gimp-console --disable-devel-docs \
    --enable-python --with-gif-compression=lzw \
    --without-aa
  make || return 1
  make DESTDIR=${startdir}/pkg install-strip

  install -Dm644 ${startdir}/src/linux.gpl \
    ${startdir}/pkg/usr/share/gimp/2.0/palettes/Linux.gpl

  ln -s gimp-2.5 ${startdir}/pkg/usr/bin/gimp
  ln -s gimp-console-2.5 ${startdir}/pkg/usr/bin/gimp-console
  ln -s gimp-remote-2.5 ${startdir}/pkg/usr/bin/gimp-remote
}
