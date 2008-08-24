# $Id$
# Maintainer: tobias <tobias@archlinux.org>

pkgname=gnome-sharp
pkgver=2.20.1
pkgrel=1
pkgdesc="GNOME bindings for C#"
arch=(i686 x86_64)
license=(LGPL)
url="http://gtk-sharp.sourceforge.net"
depends=('gtk-sharp-2>=2.12.1' 'gnome-panel>=2.22.1.2-3' 'libgnomeprintui>=2.18.2')
makedepends=('pkgconfig' 'monodoc')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-sharp/2.20/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a7fccb122b15e0a6682306e98fd79e1d')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${startdir}/src/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" \
     	 DESTDIR=${startdir}/pkg install || return 1
}
