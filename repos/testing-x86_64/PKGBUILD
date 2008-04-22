# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

# KEEP LIBTOOL FILES!
pkgname=neon
pkgver=0.28.2
pkgrel=1
pkgdesc="HTTP and WebDAV client library with a C interface"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('libxml2' 'openssl>=0.9.8g-2' 'heimdal>=1.0.1-2' 'zlib' 'expat>=2.0.1' 'db>=4.6.21')
url="http://www.webdav.org/neon/"
source=(http://www.webdav.org/neon/${pkgname}-${pkgver}.tar.gz)
md5sums=('b99b3f44e8507ae2d17362f1b34aaf02')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-ssl --enable-shared
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
