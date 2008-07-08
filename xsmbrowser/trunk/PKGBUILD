# $Id:
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=xsmbrowser
pkgver=3.4.0
pkgrel=2
pkgdesc="xSMBrowser is a Gui over the Samba utilities that allows users to easily browse Microsoft networks."
arch=('i686' 'x86_64')
url='http://www.public.iastate.edu/~chadspen/homepage.html'
#depends=('smbclient' 'expectk')
source=(http://fresh.t-systems-sfr.com/linux/src/$pkgname-$pkgver.tar.gz)
license=('GPL')
md5sums=('81961c36a2d0f8c4e8f5c20779fcb738')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  rm INSTALL
  install -D -m755 xsmbrowser $startdir/pkg/usr/bin/xsmbrowser
  install -d -m755 $startdir/pkg/usr/share/pixmaps/xsmbrowser
  install -D -m644 pixmaps/* $startdir/pkg/usr/share/pixmaps/xsmbrowser/
}
