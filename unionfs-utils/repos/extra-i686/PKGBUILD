# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Originally by z4ziggy for Archie

pkgname=unionfs-utils
pkgver=200611041820
pkgrel=1
pkgdesc="A stackable unification file system, which can merge the contents of several directories"
url="http://www.unionfs.org/"
makedepends=(autoconf automake libtool gcc)
depends=(e2fsprogs)
source=(ftp://ftp.filesystems.org/pub/unionfs/unionfs-utils-0.x/snapshots/unionfs-utils-0.1-cvs${pkgver}.tar.gz)
md5sums=('9a0e61a38c176386feb86d0b2c157afb')
options=('nolibtool')

build()
{
    cd $startdir/src/unionfs-utils-0.1-cvs${pkgver}
    ./bootstrap && ./configure --prefix=/usr
    make || return
    make DESTDIR=$startdir/pkg/ install
}
