# $Id$
# Maintainer: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=jack-audio-connection-kit
pkgver=0.109.2
pkgrel=1
pkgdesc="a low-latency audio server"
arch=(i686 x86_64)
license=(GPL2 LGPL2)
depends=('libsndfile' 'bash' 'readline' 'flac>=1.1.4')
makedepends=('doxygen')
install=jack-audio-connection-kit.install
url="http://jackit.sourceforge.net/"
backup=(etc/conf.d/jack-audio-connection-kit)
options=('!libtool')
source=(http://dl.sourceforge.net/sourceforge/jackit/${pkgname}-${pkgver}.tar.gz \
        ${pkgname}.rc.d ${pkgname}.conf.d)
md5sums=('4d8f795a6c566b9753a86038367e7e32' '4dcba5381e45bd449def164927854e48' \
         '0517b67ef912e2a84b6a15dea2dc2680')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-optimization-by-compiler \
    --enable-mmx --enable-timestamps --enable-posix-shm --libdir=/usr/lib
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m 755 ../${pkgname}.rc.d ${startdir}/pkg/etc/rc.d/${pkgname}
  install -D -m 644 ../${pkgname}.conf.d ${startdir}/pkg/etc/conf.d/${pkgname}
}
