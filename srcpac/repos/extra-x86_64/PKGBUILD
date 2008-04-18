# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=srcpac
pkgver=0.5
pkgrel=1
pkgdesc="The pacman from-source wrapper"
arch=(i686 x86_64)
url="https://xentac.net"
license=""
depends=(bash pacman)
makedepends=(subversion)
source=()
backup=(etc/srcpac.conf)

build() {
  cd $startdir/src
  svn export http://projects.xennet.org/archtools/srcpac/tags/$pkgver srcpac
  mkdir -p $startdir/pkg/etc
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/man/man1
  install -m 644 srcpac/srcpac.conf $startdir/pkg/etc
  install -m 755 srcpac/srcpac $startdir/pkg/usr/bin
  install -m 644 srcpac/srcpac.1 $startdir/pkg/usr/man/man1
}
