# $Id$
# Maintainter: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=phylip
pkgver=3.67
hauptver=3.67
pkgrel=1
pkgdesc="phylip is a collection of programmes for evolutive genetics and inferring phylogenies"
arch=(i686 x86_64)
url="http://evolution.genetics.washington.edu/phylip.html"
#source=(ftp://evolution.genetics.washington.edu/pub/phylip/$pkgname-$hauptver.tar.gz)
source=(http://evolution.gs.washington.edu/phylip/download/phylip-$hauptver.tar.gz phylip-license-text)
depends=('libxaw')
license=('custom')

build() {
  cd $startdir/src/$pkgname-$hauptver/src
  make clean
  make all || return 1
  mkdir -p $startdir/pkg/usr/bin
  make EXEDIR=$startdir/pkg/usr/bin put || return 1

  # messing with the oldfashioned fonts of phylip:
  mkdir -p $startdir/pkg/usr/share/phylip
  mv $startdir/pkg/usr/bin/font{1,2,3,4,5,6} $startdir/pkg/usr/share/phylip
  cp $startdir/pkg/usr/share/phylip/font1 $startdir/pkg/usr/share/phylip/fontfile

  # /usr/bin/factor is part of coreutils - factor -> factor_phylip
  mv $startdir/pkg/usr/bin/factor  $startdir/pkg/usr/bin/factor_phylip

  /bin/install -D -m 644 $startdir/src/phylip-license-text \
      $startdir/pkg/usr/share/licenses/$pkgname/phylip-license-text
}

md5sums=('625e45f3959fd1d2988f0f5f1704d3e5'
         '7398d58a965740cf2e54e3deb2859977')
