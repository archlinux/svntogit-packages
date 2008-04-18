# $Id$
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=tetex
pkgver=3.0
pkgrel=4
pkgdesc="TeX typesetting program"
depends=('libxmu' 'libxpm' 'libpng' 'lesstif')
conflicts=(tetex-texmf)
url='http://www.tug.org/teTeX/'
source=(ftp://tug.ctan.org/tex-archive/systems/unix/teTeX/3.0/distrib/tetex-src.tar.gz \
	ftp://tug.ctan.org/tex-archive/systems/unix/teTeX/3.0/distrib/tetex-texmf.tar.gz \
	texmf.sh)
md5sums=('944a4641e79e61043fdaf8f38ecbb4b3' 'ed9d30d9162d16ac8d5065cde6e0f6fa'\
         'a1f338c3631a83d47b41cae21d6666ef')
install=tetex.install
	
build() {
  mkdir -p $startdir/pkg/usr/share/texmf-dist
  cd $startdir/src
  mv `/bin/ls | grep -v tetex | grep -v texmf.sh` ../pkg/usr/share/texmf-dist
  cd $startdir/src/$pkgname-src-$pkgver
  ./configure --prefix=/usr --datadir=$startdir/pkg/usr/share \
	--disable-multiplatform --without-texinfo --without-dialog \
	--with-system-zlib --with-system-pnglib --with-system-ncurses
  make all || return 1
  make prefix=$startdir/pkg/usr texmf=$startdir/pkg/usr/share/texmf install
  rm -rf $startdir/pkg/usr/share/texmf-dist/doc  
  #libtoolslay
  find $startdir/pkg -name '*.la' -exec rm {} \;
  # install profile.d script
  mkdir -p $startdir/pkg/etc/profile.d
  install -m 755 $startdir/src/texmf.sh $startdir/pkg/etc/profile.d
}
