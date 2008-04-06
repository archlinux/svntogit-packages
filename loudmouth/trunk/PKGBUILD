# $Id: PKGBUILD,v 1.3 2003/11/06 08:27:17 dorphell Exp
# Maintainer: damir <damir@archlinux.org>
# Contributor: Brice Carpentier <brice.carpentier@orange.fr>

pkgname=loudmouth
pkgver=1.2.3
pkgrel=1
pkgdesc="A lightweight Jabber client library written in C/Glib"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://developer.imendio.com/wiki/Loudmouth"
depends=('glib2>=2.12.0' 'gnutls>=1.6.0' 'libidn')
options=('!libtool')
makedepends=('perlxml' 'pkgconfig')
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.2/${pkgname}-${pkgver}.tar.bz2")
md5sums=('7e25b0e13498dcb671d60d0cd62091b8')

build() {
    cd ${startdir}/src/${pkgname}-${pkgver}
    ./configure --prefix=/usr \
    		--disable-debug \
                --disable-static
    make || return 1
    make DESTDIR=${startdir}/pkg install
}
