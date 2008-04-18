# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libogg
pkgver=1.1.3
pkgrel=1
pkgdesc="Ogg bitstream and framing library"
pkgurl="http://www.xiph.org/ogg/vorbis/download"
depends=('glibc')
source=(http://downloads.xiph.org/releases/ogg/$pkgname-$pkgver.tar.gz)
md5sums=('eaf7dc6ebbff30975de7527a80831585')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

