# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=scim-anthy
pkgver=1.2.4
sf_jp_index=25404
pkgrel=1
pkgdesc="Japanese Anthy input method module for SCIM"
arch=("i686" "x86_64")
url="http://sourceforge.jp/projects/scim-imengine/"
license=GPL
depends=('scim>=1.4.7' 'anthy>=9100')
source=(http://osdn.dl.sourceforge.jp/scim-imengine/$sf_jp_index/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure   --prefix=/usr \
        --disable-static
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

