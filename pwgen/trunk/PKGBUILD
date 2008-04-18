# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor : Tobias Powalowski <t.powa@gmx.de>

pkgname=pwgen
pkgver=2.05
pkgrel=1
pkgdesc="Pwgen is a small, GPL'ed password generator which creates passwords which can be easily memorized by a human"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/pwgen/"
depends=('glibc')
source=(http://belnet.dl.sourceforge.net/sourceforge/pwgen/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   mkdir -p $startdir/pkg/usr/{bin,man/man1}
   cp $startdir/src/$pkgname-$pkgver/pwgen $startdir/pkg/usr/bin
   cp $startdir/src/$pkgname-$pkgver/pwgen.1 $startdir/pkg/usr/man/man1
 }
