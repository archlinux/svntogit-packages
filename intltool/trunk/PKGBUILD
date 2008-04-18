# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=intltool
pkgver=0.37.1
pkgrel=1
pkgdesc="The internationalization tool collection"
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/intltool"
license=('GPL')
depends=('perlxml')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('860d392f04299c2740d0752501639c3b')
sha1sums=('7aaa684177589fe321ceb863c3f6fc716e01dff2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
