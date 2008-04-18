# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kde-i18n-el
pkgver=3.5.9
pkgrel=1
pkgdesc="Greek Localization for KDE."
url="http://i18n.kde.org/stats/gui/KDE_3.5_BRANCH/el/index.php"
arch=(i686 x86_64)
license=(GPL)
source=(ftp://ftp.kde.org/pub/kde/stable/$pkgver/src/kde-i18n/$pkgname-$pkgver.tar.bz2)
depends=('kdebase>=3.5.9')


build() {
        cd $startdir/src
	cd $pkgname-$pkgver
	./configure --prefix=/opt/kde --disable-debug
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('9e08c7b4717718f9de94eaed573e3c84')
