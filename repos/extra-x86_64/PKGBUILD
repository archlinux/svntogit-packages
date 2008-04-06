# $Id: PKGBUILD,v 1.19 2007/05/16 02:39:43 kevin Exp $
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=netpbm
pkgver=10.35
pkgrel=298
pkgdesc="A toolkit for manipulation of graphic images"
arch=(i686 x86_64)
depends=('perl' 'libjpeg' 'libpng' 'libtiff' 'libxml2')
makedepends=('subversion')
url="http://netpbm.sourceforge.net/"
# Releases after 10.34 are available via SVN only.
source=(Makefile.config arch.patch)
md5sums=('cfdb69f77f8ef06f8863fe02ce27db71' 'a549e5b8e4daa4d22de601eafa9701fe')

_svntrunk=http://netpbm.svn.sourceforge.net/svnroot/netpbm/stable
_svnmod=netpbm

build() {
  /usr/bin/svn checkout --config-dir ./ -r $pkgrel $_svntrunk $_svnmod
  cd $startdir/src/$pkgname
  /usr/bin/patch -p1 < ../arch.patch
  /bin/cp ../Makefile.config .

if [ "$CARCH" == "x86_64" ]; then
  sed -i "s/^\(CFLAGS =\) .*/\1 $CFLAGS/" Makefile.config
  sed -i "s/^\(CFLAGS_SHLIB =\) .*/\1 -fPIC/" Makefile.config # real 64bit fix 
  sed -i 's/\(.*\$(SYMLINK) \)\(pnmtopnm\)\(\$(EXE) \)\(pamtopnm\)/\1\4\3\2/' converter/other/Makefile
fi

  export MAKEFLAGS="-j1"
  /usr/bin/make || return 1
  /usr/bin/make package pkgdir=$startdir/pkg/usr

  # clean up and fixing symlinks
  /bin/mv $startdir/pkg/usr/link/libnetpbm.a $startdir/pkg/usr/lib
  /bin/rm $startdir/pkg/usr/{config_template,README,pkginfo,misc,VERSION,link} -rf
  /bin/rm $startdir/pkg/usr/man/web -rf
  /bin/rm $startdir/pkg/usr/bin/doc.url
  cd $startdir/pkg/usr/lib
  /bin/ln -s ./libnetpbm.so.10 libnetpbm.so
}
# vim: ts=2 sw=2 et ft=sh
