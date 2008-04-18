# $Id$
# Maintainer: tobias <tobias@justdreams.de>
# Modified by: eliott <eliott@cactuswax.net>
# Original by Benjamin Andresen, klapmuetz [at] gmail [dot] com

pkgname=fcgi
pkgver=2.4.0
pkgrel=4
depends=('glibc')
pkgdesc="FASTCgi(fcgi) islanguage independent, high performant extension to CGI"
arch=(i686 x86_64)
license=('custom')
options=('!LIBTOOL')
url="http://www.fastcgi.com"
source=("http://www.fastcgi.com/dist/$pkgname-$pkgver.tar.gz")
md5sums=('d15060a813b91383a9f3c66faf84867e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -Dm 644 LICENSE.TERMS \
    ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
