# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=vcdimager
pkgver=0.7.23
pkgrel=5
pkgdesc="GNU VCDImager is a full-featured mastering suite for authoring disassembling and analyzing Video CD's and Super Video CD's"
arch=(i686 x86_64)
license=('GPL')
url="http://www.vcdimager.org/"
depends=('libcdio>=0.79' 'libxml2' 'popt')
options=('!libtool')
source=(ftp://ftp.gnu.org/gnu/vcdimager/${pkgname}-${pkgver}.tar.gz)
md5sums=('5e7d80fdbf0037ad20e438f2a9573253')

build() {
    cd ${startdir}/src/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=${startdir}/pkg install
}
