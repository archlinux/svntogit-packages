# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <kritoke@nospam.gmail.com>

pkgname=gnome-nettool
pkgver=2.22.0
pkgrel=1
pkgdesc="A Collection of GNOME2 Networking Tools."
arch=(i686 x86_64)
license=('GPL')
depends=('gconf>=2.22.0' 'libglade>=2.6.2')
makedepends=('gnome-doc-utils>=0.12.2' 'pkgconfig')
conflicts=('gnome-network')
replaces=('gnome-netinfo')
groups=('gnome-extra')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('290dd50a08a3859332afb6daf46dde25')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
