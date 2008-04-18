# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=libsamplerate
pkgver=0.1.2
pkgrel=4
pkgdesc="Secret Rabbit Code - aka Sample Rate Converter for audio"
arch=(i686 x86_64)
url="http://www.mega-nerd.com/SRC/index.html"
license=('GPL')
depends=('libsndfile' 'flac>=1.1.4')
source=(http://www.mega-nerd.com/SRC/libsamplerate-$pkgver.tar.gz)
md5sums=('06861c2c6b8e5273c9b80cf736b9fd0e')
options=('!libtool')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr install
}

