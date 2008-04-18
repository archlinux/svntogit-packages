# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=fvwm
pkgver=2.4.20
pkgrel=2
pkgdesc="A multiple large virtual desktop window manager originally derived from twm"
arch=('i686' 'x86_64')
url="http://www.fvwm.org"
license=('GPL' 'custom')
depends=('readline' 'libxpm' 'libxinerama' 'gtk' 'imlib' 'libstroke')
conflicts=('fvwm-devel')
source=(ftp://ftp.fvwm.org/pub/fvwm/version-2/$pkgname-$pkgver.tar.gz fvwm2.desktop)
md5sums=('3ac10558411c896f3afba285697cf42c' 'e52a6ef25a936dcf3ad0e58f2e9ed0ea')
sha1sums=('2130a16590462cbbf15f255a46abe8b8a6cb4401' 'e0924164329e7eb14e0d6137d8ff18cf6230191c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib --with-stroke
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../fvwm2.desktop $startdir/pkg/etc/X11/sessions/fvwm2.desktop

  #install license
  install -D -m0644 $startdir/src/fvwm-${pkgver}/COPYING \
                    $startdir/pkg/usr/share/licenses/${pkgname}/COPYING
}
