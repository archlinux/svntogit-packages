# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Charles-Henri d'Adhemar <cdadhemar@gmail.com>

pkgname=babl
pkgver=0.0.20
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format conversion library"
arch=('i686' 'x86_64')
url="http://gegl.org/babl/"
license=('LGPL3')
depends=('glibc' )
options=('!libtool')
source=(ftp://ftp.gtk.org/pub/babl/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('dbf67b333b0812dfe0d0f057864b0f9a')
sha1sums=('ac3ac25c3d77bc1c812b64e843cac74287a50688')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
