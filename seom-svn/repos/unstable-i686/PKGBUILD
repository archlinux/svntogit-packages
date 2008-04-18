# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=seom-svn
pkgver=179
pkgrel=1
pkgdesc="Library that implements functions to capture, save and replay videos"
arch=('i686' 'x86_64')
url="http://www.neopsis.com/projects/yukon"
depends=('libxv')
makedepends=('subversion' 'yasm')
conflicts=('seom')
provides=('seom')
source=()
md5sums=()
options=(NOLIBTOOL)

_svntrunk=svn://dbservice.com/big/svn/seom/trunk
_svnmod=seom

build() {
  cd $startdir/src
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src/$_svnmod
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
