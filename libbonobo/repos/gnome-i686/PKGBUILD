# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libbonobo
pkgver=2.22.0
pkgrel=1
pkgdesc="A set of language and system independant CORBA interfaces for creating reusable components"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('orbit2>=2.14.12' 'libxml2>=2.6.30')
makedepends=('perlxml' 'pkgconfig' 'flex')
options=('!libtool')
backup=('etc/bonobo-activation/bonobo-activation-config.xml')
replaces=('bonobo-activation')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/libbonobo/2.22/libbonobo-${pkgver}.tar.bz2
	bonobo-activation-config.xml)
install=libbonobo.install
md5sums=('998a576ad26784ac87eab99e96013527'
         '6392efaca30a26f826eafc4b8ccbc01f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --libexecdir=/usr/lib/bonobo || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -m644 ${startdir}/src/bonobo-activation-config.xml ${startdir}/pkg/etc/bonobo-activation/ || return 1
}
