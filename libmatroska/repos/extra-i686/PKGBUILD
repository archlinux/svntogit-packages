# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor 03/08/04 <lefungus@altern.org>

pkgname=libmatroska
pkgver=0.8.1
pkgrel=1
pkgdesc="Matroska library"
arch=(i686 x86_64)
url="http://dl.matroska.org/downloads/libmatroska/"
depends=('libebml>=0.7.6')
#source=(http://www.bunkus.org/videotools/mkvtoolnix/sources/$pkgname-$pkgver.tar.bz2)
source=($url/$pkgname-$pkgver.tar.bz2)

build() {
 cd $startdir/src/$pkgname-$pkgver/make/linux
 make sharedlib || return 1
 make prefix=$startdir/pkg/usr install
}

md5sums=('20cf624ace0c58a54c7752eebfbc0b19')
