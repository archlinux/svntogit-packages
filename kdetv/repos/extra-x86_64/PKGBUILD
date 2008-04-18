# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdetv
pkgver=0.8.9
pkgrel=1
pkgdesc="kdetv is a KDE application that allows you to watch television"
arch=(i686 x86_64)
url="http://www.kdetv.org"
depends=('kdelibs' 'zvbi' 'libxxf86vm' 'libxv' 'libxxf86dga' 'libxvmc')
source=(http://dziegel.free.fr/releases/$pkgname-$pkgver.tar.bz2)


build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i -e 's/libkvideoio/libkvideoiokdetv/g' kdetv/kvideoio/*
  sed -i -e 's/libkvideoio/libkvideoiokdetv/g' kdetv/plugins/video/xv/*
  sed -i -e 's/libkvideoio/libkvideoiokdetv/g' kdetv/plugins/video/v4l/*
  sed -i -e 's/libkvideoio/libkvideoiokdetv/g' kdetv/plugins/video/v4l2/*
  make -f admin/Makefile.common
  ./configure --prefix=/opt/kde --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
}
md5sums=('7a5d73e08bc133cc2db228cb6655670e')
