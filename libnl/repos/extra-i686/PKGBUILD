# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libnl
pkgver=1.1
pkgrel=1
pkgdesc="Library for applications dealing with netlink sockets"
arch=('i686' 'x86_64')
url="http://people.suug.ch/~tgr/libnl"
license=('GPL')
depends=('glibc')
source=(http://people.suug.ch/~tgr/${pkgname}/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('ae970ccd9144e132b68664f98e7ceeb1')

build() {
  cd ${startdir}/src/libnl-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
