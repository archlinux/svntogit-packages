# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=libnet
origver=1.1.2.1
pkgver=1.1.2.1
pkgrel=1
pkgdesc="A library which provides API for commonly used low-level net functions."
url="http://www.packetfactory.net/libnet"
depends=('glibc')
source=($url/dist/$pkgname-$origver.tar.gz)



build() {
        cd $startdir/src/$pkgname
        ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install || return 1
        install -D -m755 libnet-config \
                $startdir/pkg/usr/bin/libnet-config
}

md5sums=('be845c41170d72c7db524f3411b50256')
