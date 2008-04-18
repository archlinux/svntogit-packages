# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=snapscreenshot
pkgver=1.0.14.2
pkgrel=1
pkgdesc="Takes snapshot from your Linux console(s) and outputs a Targa file."
url="http://bisqwit.iki.fi/source/snapscreenshot.html"
depends=('gcc')
source=(http://bisqwit.iki.fi/src/arch/snapscreenshot-$pkgver.tar.bz2)

build()
{
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/{bin,man/man1}
  ./configure --prefix=/usr
  make BINDIR=/usr/bin \
       MANDIR=/usr/man \
        || return 1
  make BINDIR=$startdir/pkg/usr/bin \
       MANDIR=$startdir/pkg/usr/man \
        install || return 1
  chown root $startdir/pkg/usr/bin/snapscreenshot
  chgrp root $startdir/pkg/usr/bin/snapscreenshot
}



