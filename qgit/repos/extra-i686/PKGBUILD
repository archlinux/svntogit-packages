# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
pkgname=qgit
pkgver=1.5.7
pkgrel=2
pkgdesc="A GIT GUI viewer built on Qt/C++"
url="http://digilander.libero.it/mcostalba/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt3' 'git')
makedepends=()
backup=()
source=(http://downloads.sourceforge.net/sourceforge/qgit/$pkgname-$pkgver.tar.bz2 qgit.desktop qgit.png)
options=(!makeflags !ccache) #makepkg3 options, ccache is a no-go
md5sums=('2aa52a51e01ec0cde8522281d9ace2aa'
         'ecb8b35e17163a7ec6893ffa71445c40'
         '85138f44d577b03dfc738d3f27e04992')

build() {
  . /etc/profile.d/qt3.sh
  cd $startdir/src/$pkgname-$pkgver
  # added --with-qtdir so it is compilable with qt4 installed as well
  # this package ONLY supports building with qt3 at the moment
  ./configure --prefix=/usr --with-qtdir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install

  #install freedesktop files
  mkdir -p $startdir/pkg/usr/share/{applications,pixmaps}
  install -m644 $startdir/src/qgit.desktop $startdir/pkg/usr/share/applications/
  install -m644 $startdir/src/qgit.png $startdir/pkg/usr/share/pixmaps/
}
