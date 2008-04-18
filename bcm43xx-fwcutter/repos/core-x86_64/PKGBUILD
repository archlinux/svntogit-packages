# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=bcm43xx-fwcutter
pkgver=006
pkgrel=2
pkgdesc="firmware extractor for the bcm43xx kernel module"
url="http://bcm43xx.berlios.de"
depends=(glibc)
license=('GPL')
arch=('i686' 'x86_64')
source=(http://download.berlios.de/bcm43xx/$pkgname-$pkgver.tar.bz2)
md5sums=('83efd18480a4d151fc81a5f3ece60f93')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  
  sed -i "s|CFLAGS =.*|CFLAGS = $CFLAGS -fomit-frame-pointer -D_BSD_SOURCE|g" Makefile
  make

  mkdir -p $startdir/pkg/usr/bin/
  install -m755 bcm43xx-fwcutter $startdir/pkg/usr/bin/

  mkdir -p $startdir/pkg/usr/man/man1/
  install -m644 bcm43xx-fwcutter.1 $startdir/pkg/usr/man/man1/
}
