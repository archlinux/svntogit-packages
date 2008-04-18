# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=sshfs
pkgver=1.9
pkgrel=1
pkgdesc="FUSE client based on the SSH File Transfer Protocol."
arch=(i686 x86_64)
url="http://fuse.sourceforge.net/sshfs.html"
license="GPL"
depends=('fuse' 'glib2' 'openssh')
makedepends=('pkgconfig')
source=(http://switch.dl.sourceforge.net/sourceforge/fuse/$pkgname-fuse-$pkgver.tar.gz)
md5sums=('05c3da4fa0f673f7ce5f480b3023af61')

build() {
  cd $startdir/src/$pkgname-fuse-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
