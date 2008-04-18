# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kde-i18n-ms
pkgver=3.5.9
pkgrel=1
kdever=3.5.9
pkgdesc="Malay Localization for KDE."
arch=(i686 x86_64)
license=(GPL)
pkgdesc="German Localization for KDE."
url="http://i18n.kde.org/stats/gui/KDE_3.5_BRANCH/ms/index.php"
source=(ftp://ftp.kde.org/pub/kde/stable/$kdever/src/kde-i18n/$pkgname-$pkgver.tar.bz2)
depends=('kdebase>=3.5.9')

build() {
	cd $startdir/src
	cd $pkgname-$pkgver
	./configure --prefix=/opt/kde --disable-debug
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('d5f6cb0e72559106a602d26e80fdb98c')
