# $Id$
# Contributor: lowercase
# Maintainer: Dale Blount <dale@archlinux.org>
pkgname=syslinux
pkgver=3.60
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="a boot loader for the Linux operating system which operates off an MS-DOS/Windows FAT filesystem."
url="http://syslinux.org"
license=(GPL)
depends=('mtools' 'glibc')
makedepends=(nasm perl)
conflicts=()
replaces=()
backup=()
install=
source=(http://www.kernel.org/pub/linux/utils/boot/syslinux/$pkgname-$pkgver.tar.bz2)
md5sums=('96e11c6baa87a937b0726b07d687cb7b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make SBINDIR=$startdir/pkg/usr/sbin BINDIR=$startdir/pkg/usr/bin LIBDIR=$startdir/pkg/usr/lib INCDIR=$startdir/pkg/usr/include MANDIR=$startdir/pkg/usr/share/man install
	install -m755 mkdiskimage $startdir/pkg/usr/bin || return 1
}
