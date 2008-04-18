# $Id$
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: damir <damir@archlinux.org>

pkgname=gtick
pkgver=0.4.1
pkgrel=1
pkgdesc="GTick is a metronome application supporting different meters (1/1, 2/4, 3/4, 4/4 and more) and speeds ranging from 10 to 1000 bpm. It utilizes GTK+ and OSS (ALSA compatible)."
arch=('i686' 'x86_64')
url="http://www.antcom.de/gtick/"
license=('GPL3')
depends=('libsndfile' 'gtk2')
source=("http://www.antcom.de/gtick/download/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('ae0b2152cdfb98e0bba4d4e6258a22c0')
