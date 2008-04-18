# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Paulius Palevicius <paulius@birzai.com>

pkgname=catdoc
pkgver=0.94.2
pkgrel=1
pkgdesc="A convertor for Microsoft Word, Excel, PowerPoint and RTF Files to text"
arch=(i686 x86_64)
url="http://www.45.free.net/~vitus/software/catdoc/"
depends=('glibc')
source=(ftp://ftp.45.free.net/pub/catdoc/$pkgname-$pkgver.tar.gz)
md5sums=('243e1680bb3e703616f5adecfee24491')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr  --with-wish=/usr/bin/wish
  /usr/bin/make || return 1
  /usr/bin/make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh
