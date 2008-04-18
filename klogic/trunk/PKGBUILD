# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Nikos Kouremenos <nk@ebox.gr>

 pkgname=klogic
 pkgver=1.63
 pkgrel=1
 pkgdesc="KLogic is an application for building and simulating digital circuits easily."
 depends=('kdelibs>=3.5.0')

 source=(http://www.a-rostin.de/klogic/Version/$pkgname-$pkgver.tar.gz)
 url="http://www.a-rostin.de/klogic/"

 build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde
   make || return 1
   make prefix=$startdir/pkg/opt/kde install
 }

