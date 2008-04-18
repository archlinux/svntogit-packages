# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kde-i18n-af
pkgver=3.5.9
pkgrel=1
kdever=3.5.9
pkgdesc="Afrikaans Localization for KDE."
arch=(i686 x86_64)
license=(GPL)
url="http://i18n.kde.org/stats/gui/KDE_3.5_BRANCH/af/index.php"
pkgurl="ftp://ftp.kde.org/pub/kde/snapshots/kde-l10n/"
depends=('kdebase>=3.5.9')
source=(ftp://ftp.kde.org/pub/kde/stable/$kdever/src/kde-i18n/$pkgname-$pkgver.tar.bz2)
replaces=('kde-l10n-af')


build() {
	cd $startdir/src
	cd $pkgname-$pkgver
	./configure --prefix=/opt/kde --disable-debug
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('d0ad0a95f63aacfa0dd11b90d7bbea29')
