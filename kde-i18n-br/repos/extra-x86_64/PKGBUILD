# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>


pkgname=kde-i18n-br
pkgver=3.5.9
pkgrel=1
kdever=3.5.9
arch=(i686 x86_64)
license=(GPL)
pkgdesc="Breton Localization for KDE."

url="http://i18n.kde.org/stats/gui/KDE_3.5_BRANCH/br/index.php"

depends=('kdebase>=3.5.9')
source=(ftp://ftp.kde.org/pub/kde/stable/$kdever/src/kde-i18n/$pkgname-$pkgver.tar.bz2)


build() {
	cd $startdir/src
	cd $pkgname-$pkgver
	./configure --prefix=/opt/kde --disable-debug
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('1eb0051fddfe0f7ca5489999ad0a954b')
