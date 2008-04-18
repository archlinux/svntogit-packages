# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# AUR Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
pkgname=twinkle-kdefree
pkgver=1.1
pkgrel=2
pkgdesc="A SIP softphone for Qt [without kde support/dependency]"
arch=(i686 x86_64)
url="http://www.twinklephone.com/"
license=("GPL")
depends=('qt3' 'ccrtp>=1.5.1' 'libsndfile' 'speex' 'boost>=1.34.0' 'gnutls' 'libzrtpcpp>=0.9.0-2' \
         'commoncpp2>=1.6')
makedepends=('pkgconfig')
conflicts=('twinkle')
provides=('twinkle')
source=(http://www.xs4all.nl/~mfnboer/twinkle/download/twinkle-$pkgver.tar.gz \
	twinkle.desktop )

build() {
  cd $startdir/src/twinkle-$pkgver
  . /etc/profile.d/qt3.sh
  ./configure --prefix=/usr --without-kde
  make || return 1
  make prefix=$startdir/pkg/usr install
  install -D -m 644 $startdir/pkg/usr/share/twinkle/twinkle48.png $startdir/pkg/usr/share/pixmaps/twinkle.png
  install -D -m 644 $startdir/src/twinkle.desktop $startdir/pkg/usr/share/applications/twinkle.desktop
}
md5sums=('40f8341a4a82c06d00bd1b326d9c6bbf'
         'ef03b438033b591ec122b3934f80c23e')
