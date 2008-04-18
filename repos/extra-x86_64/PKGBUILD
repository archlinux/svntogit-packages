# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=netpbm
pkgver=10.35
# pkgrel is the revision number of the stable branch
pkgrel=608
pkgdesc="A toolkit for manipulation of graphic images"
arch=(i686 x86_64)
license=('custom' 'BSD' 'GPL' 'LGPL')  
depends=('perl' 'libjpeg' 'libpng' 'libtiff' 'libxml2')
makedepends=('subversion')
url="http://netpbm.sourceforge.net/"
# Releases after 10.34 are available via SVN only.
source=(Makefile.config arch.patch)
md5sums=('cfdb69f77f8ef06f8863fe02ce27db71' '88992e053dbfa9fdde2cccea32e6632b')

svntrunk=http://netpbm.svn.sourceforge.net/svnroot/netpbm/stable
svnmod=netpbm

build() {
  /usr/bin/svn checkout --config-dir ./ -r ${pkgrel} ${svntrunk} ${svnmod}
  cd ${startdir}/src/${pkgname}
  /usr/bin/patch -p1 < ../arch.patch
  /bin/cp ../Makefile.config .

if [ "${CARCH}" == "x86_64" ]; then
  sed -i "s/^\(CFLAGS =\) .*/\1 $CFLAGS/" Makefile.config
  sed -i "s/^\(CFLAGS_SHLIB =\) .*/\1 -fPIC/" Makefile.config # real 64bit fix 
  sed -i 's/\(.*\$(SYMLINK) \)\(pnmtopnm\)\(\$(EXE) \)\(pamtopnm\)/\1\4\3\2/' converter/other/Makefile
fi

  export MAKEFLAGS="-j1"
  /usr/bin/make || return 1
  /usr/bin/make package pkgdir=${startdir}/pkg/usr PKGMANDIR=share/man

  # clean up and fixing symlinks
  /bin/mv ${startdir}/pkg/usr/link/libnetpbm.a ${startdir}/pkg/usr/lib
  /bin/rm ${startdir}/pkg/usr/{config_template,README,pkginfo,misc,VERSION,link} -rf
  /bin/rm ${startdir}/pkg/usr/man -rf
  /bin/rm ${startdir}/pkg/usr/bin/doc.url
  cd ${startdir}/pkg/usr/lib
  /bin/ln -s ./libnetpbm.so.10 libnetpbm.so

  # Licensing.  Note that each program in the package has a separate license.
  install -D -m644 ${startdir}/src/${pkgname}/doc/copyright_summary \
      ${startdir}/pkg/usr/share/licenses/${pkgname}/copyright_summary.txt || return 1
}
# vim: ts=2 sw=2 et ft=sh
