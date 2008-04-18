# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=tcl
pkgver=8.5.2
pkgrel=1
pkgdesc="The Tcl scripting language"
arch=('i686' 'x86_64')
license=('custom')
depends=(glibc)
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
url="http://tcl.sourceforge.net/"
md5sums=('2eeff7a61844b3e6de5202da1275cff1')

build() {
  cd ${startdir}/src/tcl${pkgver}/unix
if [ "$CARCH" = "x86_64" ]; then
  ./configure --prefix=/usr --enable-threads --enable-64bit
  else   ./configure --prefix=/usr --enable-threads --disable-64bit
fi
  make || return 1
  make INSTALL_ROOT=${startdir}/pkg install install-private-headers
  ln -sf tclsh8.5 ${startdir}/pkg/usr/bin/tclsh
  # install license
  install -Dm644 ../license.terms $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

  # remove buildroot traces / fixes #3602
  sed -i \
  -e "s,^TCL_BUILD_LIB_SPEC='-L.*/unix,TCL_BUILD_LIB_SPEC='-L/usr/lib," \
  -e "s,^TCL_SRC_DIR='.*',TCL_SRC_DIR='/usr/include'," \
  -e "s,^TCL_BUILD_STUB_LIB_SPEC='-L.*/unix,TCL_BUILD_STUB_LIB_SPEC='-L/usr/lib," \
  -e "s,^TCL_BUILD_STUB_LIB_PATH='.*/unix,TCL_BUILD_STUB_LIB_PATH='/usr/lib," \
  -e "s,^TCL_LIB_FILE='libtcl8.5..TCL_DBGX..so',TCL_LIB_FILE=\"libtcl8.5\$\{TCL_DBGX\}.so\"," \
  -e "s,^TCL_CC_SEARCH_FLAGS='\(.*\)',TCL_CC_SEARCH_FLAGS='\1:/usr/lib'," \
  -e "s,^TCL_LD_SEARCH_FLAGS='\(.*\)',TCL_LD_SEARCH_FLAGS='\1:/usr/lib'," \
  $startdir/pkg/usr/lib/tclConfig.sh
}
