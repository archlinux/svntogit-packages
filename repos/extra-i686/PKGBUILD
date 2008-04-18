# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=htop
pkgver=0.7
pkgrel=2
pkgdesc="Ncurses based interactive process viewer"
arch=('i686' 'x86_64')
url="http://htop.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=("http://switch.dl.sourceforge.net/sourceforge/htop/htop-$pkgver.tar.gz"
	"htop-0.7-unicode.patch")

build() {
  cd $startdir/src/  
  # apply unicode patch from 
  # http://sourceforge.net/tracker/index.php?func=detail&aid=1852696&group_id=108839&atid=651635
  # http://bugs.archlinux.org/task/8956
  patch -Np0 -i $startdir/src/htop-0.7-unicode.patch

  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('4afc961fa709167e1b434682897991f9'
         '05b1c36e3fcb08ef974980a4a21c3834')
