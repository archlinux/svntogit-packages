# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dopewars
pkgver=1.5.12
pkgrel=1
pkgdesc="dopewars is a Drug dealing game set in New York"
arch=(i686 x86_64)
depends=('gtk2>=2.8.13' 'alsa-lib' 'audiofile' 'esd' 'sdl_mixer')
url="http://dopewars.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('debf749de9053dc2fb2e74c37ae06206')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
	mv $startdir/pkg/usr/var $startdir/pkg/var
	mkdir -p $startdir/pkg/usr/share/applications
	mv $startdir/pkg/usr/share/gnome/apps/Games/dopewars.desktop $startdir/pkg/usr/share/applications
	rm -r $startdir/pkg/usr/share/gnome
	chown root.root $startdir/pkg/usr/bin/dopewars
	chmod 755 $startdir/pkg/usr/bin/dopewars
	chown root.users $startdir/pkg/var/dopewars.sco
	chmod 664 $startdir/pkg/var/dopewars.sco
}
