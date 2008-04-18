# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kshutdown
pkgver=1.0.2
pkgrel=1
pkgdesc="Shutdown Utility for KDE"
arch=(i686 x86_64)
url="http://kshutdown.sourceforge.net/"
license=('GPL')
depends=('kdelibs')
source=(http://switch.dl.sourceforge.net/sourceforge/kshutdown/$pkgname-$pkgver.tar.bz2)

build()        {
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/opt/kde --enable-final
                # remove enable-final if you have less than 512MB RAM
        make || return 1
#        mkdir -p $startdir/pkg/opt/kde/share/apps/kconf_update/
        make DESTDIR=$startdir/pkg install
}
md5sums=('3e945657f856adf367a18fc11cf25382')
