# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
#Contributor: Jacobo Arvelo <unix4all@ya.com> 
pkgname=wesnoth 
pkgver=1.2.8
pkgrel=1
pkgdesc="A turn-based strategy game on a fantasy world" 
arch=(i686 x86_64)
license=('GPL')
url="http://www.wesnoth.org/" 
depends=('sdl_ttf' 'sdl_net' 'sdl_mixer' 'sdl_image' 'libvorbis' 'fribidi' 'freetype2' 'gcc-libs')
#source=(http://www.wesnoth.org/files/$pkgname-$pkgver.tar.gz) 
install=wesnoth.install
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2) 


build() { 
  cd $startdir/src/$pkgname-$pkgver 
  ./configure --prefix=/usr --enable-tools --enable-editor --enable-server 
  make || return 1 
  make prefix=$startdir/pkg/usr install 
# install menu entry
  install -D -m644 icons/wesnoth.desktop $startdir/pkg/usr/share/applications/wesnoth.desktop
  install -D -m644 images/wesnoth-icon.png $startdir/pkg/usr/share/pixmaps/wesnoth-icon.png 
}
md5sums=('99d17b23d2ea4dc3a008f5c69cd43789')
md5sums=('99d17b23d2ea4dc3a008f5c69cd43789')
