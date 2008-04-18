# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=wvstreams
pkgver=4.4.1
pkgrel=2
pkgdesc="A network programming library written in C++"
arch=(i686 x86_64)
url="http://alumnit.ca/wiki/?page=WvStreams"
license=('LGPL')
depends=('zlib' 'pam' 'xplc' "openssl>=0.9.8f" 'readline')
source=(http://wvstreams.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
	gcc-4.3.patch)
md5sums=('907b0cba8931553d848620ea16f006b9' '004949f9b334fefa844eee704159d3f4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  if [ "$CARCH" = "x86_64" ]; then
    export CFLAGS="$CFLAGS -fPIC"
  fi
  patch -Np1 -i ${startdir}/src/gcc-4.3.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --without-gtk --without-vorbis --without-qt \
    --without-swig --with-openssl  || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
