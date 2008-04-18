# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Original TU: Jeff Mickey <j@codemac.net>
# Contributor: ciccio.a

pkgname=squashfs-tools
pkgver=3.2
_realver=3.2
pkgrel=1
pkgdesc="Tools for squashfs, a highly compressed read-only filesystem for Linux."
url="http://squashfs.sourceforge.net"
license="GPL"
depends=('zlib' 'glibc')
source=(http://easynews.dl.sourceforge.net/sourceforge/squashfs/squashfs$_realver.tar.gz)
md5sums=('e4818dbd8a81519ade8a41d26587c3f5')

build()
{
    cd $startdir/src/squashfs$_realver/$pkgname
    make || return 1
    mkdir -p $startdir/pkg/sbin
    cp -a mksquashfs unsquashfs $startdir/pkg/sbin
}
