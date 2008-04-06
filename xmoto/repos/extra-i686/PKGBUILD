# $Id: PKGBUILD,v 1.13 2008/02/16 21:39:59 travis Exp $
# Maintainer: Travis Willard <travisw@wmpub.ca> 
# Contributor: Denis (dtonator@gmail.com)

pkgname=xmoto
pkgver=0.4.1
pkgrel=2
pkgdesc="A challenging 2D motocross platform game, where physics play an important role."
arch=('i686' 'x86_64')
url="http://xmoto.tuxfamily.org"
license=('GPL')
depends=('bzip2' 'libjpeg' 'libpng' 'lua' 'sdl_mixer' 'ode' 'curl>=7.16.2' 
	 'mesa' 'libxdamage' 'libxfixes' 'sqlite3' 'sdl_ttf' 'desktop-file-utils')
install=xmoto.install
source=(http://download.tuxfamily.org/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-src.tar.gz)
md5sums=('e3e9830ff58bb4a25685ecfd3a9c5f95')

build() {
  cd $startdir/src/xmoto-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg mangdir=/usr/share/man/man6 install

  #install desktop file
  install -Dm0644 $startdir/src/xmoto-${pkgver}/extra/xmoto.desktop $startdir/pkg/usr/share/applications/xmoto.desktop
  #install icon for desktop file
  install -Dm0644 $startdir/src/xmoto-${pkgver}/extra/xmoto.xpm $startdir/pkg/usr/share/pixmaps/xmoto.xpm
}

