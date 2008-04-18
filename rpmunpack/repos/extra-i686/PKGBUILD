# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=rpmunpack
pkgver=0
pkgrel=1
pkgdesc="This program converts rpm archives to cpio archives for cpio or afio"
source=(http://www.ibiblio.org/pub/Linux/utils/package/$pkgname.tar.gz)
url="http://www.ibiblio.org/pub/Linux/utils/package"
build() {
cd $startdir/src/$pkgname
make || return 1
mkdir -p $startdir/pkg/usr/bin
cp rpmunpack $startdir/pkg/usr/bin
}
