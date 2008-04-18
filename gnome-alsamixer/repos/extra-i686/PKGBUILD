# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=gnome-alsamixer
pkgver=0.9.6
pkgrel=2
arch=(i686)
license=('GPL')
pkgdesc="Gnome ALSA mixer"
url="http://www.paw.za.org"
depends=('libgnomeui>=2.18.1-2')
source=(ftp://ftp.paw.za.org/pub/PAW/sources/${pkgname}-${pkgver}.tar.gz
	gnome-alsamixer-0.9.6-gtk24.patch)
md5sums=('387623cfeb079d78325eed2d6bc94251' '82b95a0df43429da5098b4da883f6bd0')
build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/gnome-alsamixer-0.9.6-gtk24.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
