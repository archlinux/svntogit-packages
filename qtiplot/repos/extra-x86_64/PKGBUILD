# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=qtiplot
pkgver=0.9
origver=0.9
pkgrel=1
pkgdesc="Data analysis and scientific plotting - free clone of Origin"
arch=("i686" "x86_64")
depends=('qwt>=5.0.2' 'qwtplot3d>=0.2.7' 'qt>=4.2' 'muparser>=1.28' 'gsl' 'liborigin>=20070926' 'python>=2.5.1' 'pyqt' 'sip')
license=("GPL2")
source=("http://soft.proindependent.com/src/qtiplot-$origver.tar.bz2" \
	    "$pkgname.desktop" \
        "$pkgname.png" \
        "qtiplot-archlinux.pro")
url="http://soft.proindependent.com/qtiplot.html"

build() {
  cp -f $startdir/src/qtiplot-archlinux.pro \
        $startdir/src/$pkgname-$origver/$pkgname/qtiplot.pro || return 1
  cd $startdir/src/$pkgname-$origver/$pkgname
  export QMAKESPEC=linux-g++

  qmake qtiplot.pro || return 1
  make QTDIR=/usr/ QMAKESPEC=linux-g++ || return 1
  install -D $startdir/src/$pkgname-$origver/$pkgname/$pkgname $startdir/pkg/usr/bin/$pkgname || return 1

  # make it nice:
  install -D -m644 $startdir/src/$pkgname.png \
  $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m644 $startdir/src/$pkgname.desktop \
  $startdir/pkg/usr/share/applications/$pkgname.desktop
}

