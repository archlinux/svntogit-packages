# $Id$
# Contributor: Tobias Powalowski
# Maintainer: damir <damir@archlinux.org>

pkgname=k3b-i18n
pkgver=1.0.4
pkgrel=1
pkgdesc="Localizations for k3b"
arch=('i686' 'x86_64')
url="http://k3b.sourceforge.net/"
license=('GPL')
depends=('k3b>=$pkgver')
source=(http://switch.dl.sourceforge.net/sourceforge/k3b/$pkgname-$pkgver.tar.bz2)

build(){
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/opt/kde --enable-mt --enable-final
                # remove enable-final if you have less than 512MB RAM
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('27833d12b8e9438eb7a10c5ab330fee1')
