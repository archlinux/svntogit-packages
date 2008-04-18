# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=xchat
pkgver=2.8.4
pkgrel=3
pkgdesc="A GTK+ based IRC client"
arch=('i686' 'x86_64')
url="http://www.xchat.org/"
license=('GPL')
depends=('gtk2>=2.10.9' 'openssl>=0.9.8b' 'dbus-glib>=0.7.2')
makedepends=('tcl' 'perl' 'python')
options=('!libtool')
source=(http://www.xchat.org/files/source/2.8/${pkgname}-${pkgver}.tar.bz2)
md5sums=('66d60febc62a01bafac9bb3a35fb37ae')
sha1sums=('6ac509624c241edfac5d53d9d4ece63d917613d6')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --enable-openssl --enable-dbus \
              --disable-gnome --disable-textfe \
	      --enable-ipv6 --enable-shm \
	      --enable-spell=none
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
