# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=maxima
pkgver=5.14.0
pkgrel=1
pkgdesc="Maxima - a sophisticated computer algebra system"
arch=("i686" "x86_64")
license=('GPL')
url="http://maxima.sourceforge.net"
depends=('clisp>=2.41' 'librep' 'libsigsegv' 'readline' 'bash')
# needs rebuild when {readline,bash} changes version
install=$pkgname.install

source=("http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz" "$pkgname.desktop")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  # install some freedesktop.org compatibility
  install -D -m644 $startdir/src/$pkgname.desktop \
  $startdir/pkg/usr/share/applications/$pkgname.desktop
  # make sure, we have a nice icon for the desktop file at the right place ;)
  mkdir -p $startdir/pkg/usr/share/pixmaps/
  cd $startdir/pkg/usr/share/pixmaps/
  ln -s /usr/share/maxima/${pkgver}/xmaxima/maxima-new.png ${pkgname}.png
}


md5sums=('8afd0efee916c983d875a396ec405ad2'
         'a44160f17c95d4ce1d6f3b4ca7cf6b9e')
