# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=lftp
pkgver=3.7.0
pkgrel=1
pkgdesc="Sophisticated command line based FTP client"
arch=('i686' 'x86_64')
license=('GPL')
depends=(gcc-libs readline 'openssl>=0.9.8f' 'expat>=2.0.1')
url="http://lftp.yar.ru/"
backup=('etc/lftp.conf')
source=(http://ftp.yars.free.net/pub/source/lftp/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7026dad237434ee35603049b978930df')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --without-gnutls \
	--with-openssl
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf ${startdir}/pkg/usr/lib
}
