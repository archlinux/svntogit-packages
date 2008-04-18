# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ethstatus
pkgver=0.4.2
pkgrel=1
pkgdesc="EthStatus was developed for Linux users that are usually in console mode, based on PPPStatus"
depends=('ncurses')
source=(http://ftp.debian.org/debian/pool/main/e/ethstatus/ethstatus_$pkgver.orig.tar.gz)
md5sums=('d517860563e915c5104c52b1074085ae')
url="http://ethstatus.calle69.net/graphic/index.html"

build() {
    cd $startdir/src/ethstatus-$pkgver
    mkdir -p $startdir/pkg/usr
    mkdir -p $startdir/pkg/usr/bin
    make || return 1
    install -o 0 -g 0 -s -m 0755 ethstatus $startdir/pkg/usr/bin
    install -D -m644  ethstatus.1 $startdir/pkg/usr/man/man1/ethstatus.1
}
