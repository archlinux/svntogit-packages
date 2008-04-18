# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=progsreiserfs
pkgver=0.3.0.5
pkgrel=3
depends=('e2fsprogs')
pkgdesc="library for accessing and manipulating reiserfs partitions"
arch=(i686 x86_64)
source=(#ftp://ftp.namesys.com/pub/libreiserfs/$pkgname-$pkgver.tar.gz
	ftp://ftp.archlinux.org/other/progsreiserfs/$pkgname-$pkgver.tar.gz
	)
url="http://www.namesys.com"
md5sums=('d822579bbd4a29a1be5e4490869d9bee')

build()        {
        cd $startdir/src/$pkgname-$pkgver
        libtoolize -f
        aclocal
        ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg/ install
	rm $startdir/pkg/usr/share/man/man8/mkfs.reiserfs.8
        rm $startdir/pkg/usr/share/man/man8/resizefs.reiserfs.8
        rm $startdir/pkg/usr/share/man/man8/tunefs.reiserfs.8
	##libtoolslay
	find $startdir/pkg -name '*.la' -exec rm {} \;
}
