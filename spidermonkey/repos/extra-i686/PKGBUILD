# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: AUR

pkgname=spidermonkey
pkgver=1.60
pkgrel=1
pkgdesc="Mozilla's C implementation of JavaScript."
arch=("i686" "x86_64")
url="http://www.mozilla.org/js/spidermonkey/"
depends=('nspr')
source=("http://ftp.mozilla.org/pub/mozilla.org/js/js-$pkgver.tar.gz" \
	"spidermonkey-1.5-threadsafe.patch")
md5sums=('bd8f021e43a8fbbec55ac2cd3d483243' '09d90eeeb50c1e7f8ad06bfa9ab2b93f')

build()
{
  export MAKEFLAGS="-j1"
  cd $startdir/src/js/src
  # fix for the lib location
  [ "$CARCH" = "x86_64" ] && sed -i -e "s:lib64:lib:g" config.mk
  # patch Makefile for threadsafe support with native nspr
  patch -p2 -i $startdir/src/spidermonkey-1.5-threadsafe.patch || return 1 
  # build - threadsafe
  make -f Makefile.ref BUILD_OPT=1 JS_THREADSAFE=1 DIST=$startdir/pkg/usr all export || return 1
  # install
  mkdir -p $startdir/pkg/usr/include/js
  mv $startdir/pkg/usr/include/*.h $startdir/pkg/usr/include/js/
}
