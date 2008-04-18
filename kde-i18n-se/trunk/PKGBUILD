# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>


pkgname=kde-i18n-se
pkgver=3.5.9
kdever=3.5.9
pkgrel=1
arch=(i686 x86_64)
license=(GPL)
pkgdesc="Northern Sami Localization for KDE."
url="http://i18n.kde.org/stats/gui/KDE_3.5_BRANCH/se/index.php"
source=(ftp://ftp.kde.org/pub/kde/stable/$kdever/src/kde-i18n/$pkgname-$pkgver.tar.bz2)
depends=('kdebase>=3.5.9')



build() {
        cd $startdir/src
        cd $pkgname-$pkgver	
	./configure --prefix=/opt/kde --disable-debug
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('c39451b79cad946ea95dba338fce4196')
