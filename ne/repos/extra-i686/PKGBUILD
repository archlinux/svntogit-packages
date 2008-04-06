# $Id: PKGBUILD,v 1.4 2005/11/23 18:34:22 kevin Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=1.41
pkgrel=1
pkgdesc="the nice editor"
url="http://ne.dsi.unimi.it"
depends=('glibc' 'ncurses')
source=(http://ne.dsi.unimi.it/$pkgname-$pkgver.tar.gz)
md5sums=('023e68d23a6216e89737ff2b6996aa77')

build() {
  cd $startdir/src/$pkgname-$pkgver/src
  sed -i 's|<ncurses/term.h>|<term.h>|g' {ne.h,cm.c,term.c}
  make || return 1
  mkdir -p $startdir/pkg/usr/bin/
  cp ne $startdir/pkg/usr/bin
}

