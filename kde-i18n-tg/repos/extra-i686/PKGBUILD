# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kde-i18n-tg
pkgver=3.5.9
pkgrel=1
kdever=3.5.9
pkgdesc="Tajik Localization for KDE."
arch=(i686 x86_64)
license=(GPL)
url="http://i18n.kde.org/stats/gui/KDE_3.5_BRANCH/tg/index.php"
source=(ftp://ftp.kde.org/pub/kde/stable/$kdever/src/kde-i18n/$pkgname-$pkgver.tar.bz2)
depends=('kdebase>=3.5.9')


build() {
	cd $startdir/src
	cd $pkgname-$pkgver
	./configure --prefix=/opt/kde --disable-debug
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('e83a4c33e1301a5252b9c34bcb5412f5')
