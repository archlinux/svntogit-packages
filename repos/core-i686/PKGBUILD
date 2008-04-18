# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre
pkgver=7.6
pkgrel=3
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=('i686' 'x86_64') 
url="http://pcre.sourceforge.net"
license=('custom')
groups=('base')
depends=('gcc-libs')
options=('!libtool')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${pkgname}-${pkgver}.tar.bz2
	no_arg.patch)
md5sums=('2af38e083fb90ef60fa9eda7cc290e86'
         '9adcec8fce27628753a89f67b52c6ff2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  [ "${CARCH}" = "x86_64" ] && export CFLAGS="${CFLAGS} -fPIC"
  patch -Np0 -i ${startdir}/src/no_arg.patch || return 1
  ./configure --prefix=/usr --enable-utf8 --enable-unicode-properties
  make || return 1
  make DESTDIR=${startdir}/pkg install
  # grep uses pcre, so we need the libs in /lib
  mkdir -p ${startdir}/pkg/lib
  mv ${startdir}/pkg/usr/lib/libpcre.so.* ${startdir}/pkg/lib/
  ln -sf ../../lib/libpcre.so.0 ${startdir}/pkg/usr/lib/libpcre.so
  install -D -m644 LICENCE ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
