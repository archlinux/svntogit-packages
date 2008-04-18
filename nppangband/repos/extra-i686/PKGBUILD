# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>

pkgname=nppangband
pkgver=0.4.1
pkgrel=1
pkgdesc="A variant of Angband that attempts to take popular ideas from other variants"
url="http://members.cox.net/nppangband/"
depends=('ncurses' 'libxaw')
source=(http://members.cox.net/nppangband/NPPAngband-0.4.1-Source.zip)
md5sums=('ed03a27b7575cd806e31609529736716')


build() {

  cd $startdir/src/NPPAngband-Source-v0.4.1/src/
  sed 's@# define DEFAULT_PATH "./lib/"@# define DEFAULT_PATH "/usr/lib/nppangband/"@' -i config.h
  make -f Makefile.std
  mkdir -p $startdir/pkg/usr/bin $startdir/pkg/usr/lib
  cp angband $startdir/pkg/usr/bin/nppangband
  cp -R $startdir/src/NPPAngband-Source-v0.4.1/lib $startdir/pkg/usr/lib/nppangband/
  chmod -R 775 $startdir/pkg/usr/lib/nppangband/
  chown -R root:users $startdir/pkg/usr/lib/nppangband/
}
