# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=fcitx
pkgver=3.5.070703
basever=3.5
origver=3.5-070703
pkgrel=1
pkgdesc="Free Chinese Input Toy of X - Input Method Server for X window system (XIM)"
arch=("i686" "x86_64")
url="http://www.fcitx.org/"
depends=('libxft' 'libxpm')
source=($url/download/$pkgname-$origver.tar.bz2)

build() {
    cd $startdir/src/$pkgname-$basever
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg/ install
}
md5sums=('1023b3febc5660101d75eb57b8948f69')
