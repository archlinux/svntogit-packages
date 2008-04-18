# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Neil Lin <neil@vip.url.com.tw>

pkgname=stardict
pkgver=3.0.1
pkgrel=1
pkgdesc="StarDict is a powerful international dictionary written in Gtk2."
arch=(i686 x86_64)
url="http://stardict.sourceforge.net/"
license=('GPL')
depends=('festival' 'libsigc++2.0' 'gucharmap' 'enchant')
makedepends=('perlxml' 'popt')
source=(http://downloads.sourceforge.net/sourceforge/stardict/$pkgname-$pkgver.tar.bz2)
options=('!libtool' '!emptydirs')

build()
{
   cd $startdir/src/$pkgname-$pkgver

   ./configure 	PKG_CONFIG=/usr/bin/pkg-config --prefix=/usr --sysconfdir=/etc \
        --mandir=/usr/man --disable-gnome-support --disable-schemas-install \
        --disable-espeak
   make || return 1
   make DESTDIR=$startdir/pkg install
}
