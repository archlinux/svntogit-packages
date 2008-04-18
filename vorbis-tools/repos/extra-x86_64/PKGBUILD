# $Id$
# Maintainer: Travis Willard <travis@archlinux.org>
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=vorbis-tools
pkgver=1.2.0
pkgrel=3
pkgdesc="Extra tools for Ogg-Vorbis"
arch=(i686 x86_64)
url='http://www.xiph.org/vorbis/'
license=('GPL')
depends=('libao' 'libvorbis' 'curl>=7.16.2' 'flac>=1.1.4')
source=(http://downloads.xiph.org/releases/vorbis/$pkgname-$pkgver.tar.gz)
md5sums=('df976d24e51ef3d87cd462edf747bf9a')

build() 
{
  cd $startdir/src/$pkgname-$pkgver
  autoconf
  ./configure --prefix=/usr --without-speex 
  make || return 1
  make DESTDIR=$startdir/pkg install
}

