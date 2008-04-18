# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libvorbis
pkgver=1.2.0
pkgrel=1
pkgdesc="Vorbis codec library"
arch=(i686 x86_64)
license=('custom')
url="http://www.xiph.org/ogg/vorbis/"
depends=('glibc' 'libogg')
source=(http://downloads.xiph.org/releases/vorbis/$pkgname-$pkgver.tar.gz)
md5sums=('478646358c49f34aedcce58948793619')


build() {
  cd $startdir/src/${pkgname}-${pkgver}
  #-march=i686 optimizes too much, strip it out
  CFLAGS=${CFLAGS/-march=$CARCH} ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -Dm644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
