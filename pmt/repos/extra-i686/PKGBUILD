# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=pmt
pkgver=2006.06.11
pkgrel=1
pngcrushver=1.6.4
pngmetaver=1.11
bmp2pngver=1.62
pkgdesc="PNG and MNG tools"
url="http://pmt.sourceforge.net/"
depends=("libpng")
source=(	"http://puzzle.dl.sourceforge.net/sourceforge/pmt/pngcrush-${pngcrushver}.tar.gz" \
	"http://puzzle.dl.sourceforge.net/sourceforge/pmt/pngmeta-${pngmetaver}.tar.gz" \
	"http://cetus.sakura.ne.jp/softlab/b2p-home/archives/bmp2png-${bmp2pngver}.tar.gz" \
)

build() {
  cd $startdir/src/pngmeta-${pngmetaver}
	./configure --prefix=/usr
  	make || return 1
 	make DESTDIR=$startdir/pkg install || return 1

  cd $startdir/src/pngcrush-${pngcrushver}
  	make || return 1
 	/bin/install -c pngcrush $startdir/pkg/usr/bin/pngcrush || return 1

  cd $startdir/src/bmp2png-${bmp2pngver}
  	make BINDIR=/usr/bin || return 1
	sed -i "s|$(INSTALL) bmp2png png2bmp $(BINDIR)|$(INSTALL) bmp2png png2bmp $startdir/pkg$(BINDIR)|g" Makefile
  	make BINDIR=/usr/bin install || return 1
}

