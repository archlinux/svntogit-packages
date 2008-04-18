# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=lbreakout2
pkgver=2.6beta_7
pkgrel=1
pkgdesc="A breakout game with nice effects, graphics, and sounds"
arch=(i686 x86_64)
depends=('sdl_mixer' 'libvorbis' 'libpng')
source=(http://dl.sourceforge.net/lgames/$pkgname-${pkgver/_/-}.tar.gz)
url="http://lgames.sourceforge.net/"
license=(GPL)

build() {
  cd $startdir/src/$pkgname-${pkgver/_/-}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

md5sums=('bccede972d2f73612c47ca6a5aa9770e')
sha1sums=('7d1c718bdcf3146c0992538c297e8f6fa4adb603')
