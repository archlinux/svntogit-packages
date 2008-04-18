# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>
pkgname=sweep
pkgver=0.9.2
pkgrel=1
pkgdesc="Sound editing and mixing program"
arch=(i686 x86_64)
depends=('tdb' 'gtk2' 'libsamplerate' 'libmad' 'libvorbis' 'alsa-lib' 'speex')
options=(NOLIBTOOL)
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://www.metadecks.org/software/sweep/"

build() {
  cd $startdir/src/sweep-$pkgver
  ./configure --prefix=/usr --enable-alsa --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make prefix=$startdir/pkg/usr sysconfdir=$startdir/pkg/etc localstatedir=$startdir/pkg/var install
}
md5sums=('802ad376c43b6e5688e04d2f3dc35943')
