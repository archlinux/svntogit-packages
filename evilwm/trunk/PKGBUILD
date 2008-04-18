# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=evilwm
pkgver=1.0.0
pkgrel=1.1
pkgdesc="A minimalist but usable window manager for the X Window System."
arch=('i686' 'x86_64')
depends=('libxext' 'libxrandr')
url="http://evilwm.sourceforge.net"
source=(http://www.6809.org.uk/evilwm/$pkgname-$pkgver.tar.gz evilwm.desktop)
license=(custom)
md5sums=('aa66a68f54dda48ff3bcef23ea852e59'
         'fd404c0f0787fbf99b8b3270f639128c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
  install -D -m644 $startdir/evilwm.desktop \
      $startdir/pkg/etc/X11/sessions/evilwm.desktop
  install -D -m644 README $startdir/pkg/usr/share/licenses/$pkgname/README
}
