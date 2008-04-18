# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libsasl
pkgver=2.1.22
pkgrel=5
pkgdesc="Cyrus Simple Authentication Service Layer (SASL) library"
arch=(i686 x86_64)
url="http://asg.web.cmu.edu/cyrus/download/"
depends=('db>=4.6')
install=libsasl.install
source=(ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-sasl-${pkgver}.tar.gz
	cyrus-sasl-2.1.19-checkpw.c.patch db-4.6.patch)
md5sums=('45dde9d19193ae9dd388eb68b2027bc9'
         'e27ddff076342e7a3041c4759817d04b'
         '7766525d44d7659ce3e3e6587981c351')
options=('!makeflags')

build() {
  cd ${startdir}/src/cyrus-sasl-${pkgver}
  patch -Np0 -i ${startdir}/src/cyrus-sasl-2.1.19-checkpw.c.patch || return 1
  patch -Np0 -i ${startdir}/src/db-4.6.patch || return 1
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--localstatedir=/var \
	--disable-anon \
	--disable-cram \
	--disable-digest \
	--disable-gssapi \
	--enable-login \
	--disable-otp \
	--enable-plain
  for dir in include lib sasldb plugins utils; do
    pushd ${dir} || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg install || return 1
    popd
  done
}
