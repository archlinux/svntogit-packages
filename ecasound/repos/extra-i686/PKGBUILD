# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=ecasound
pkgver=2.4.5
pkgrel=1
pkgdesc="Ecasound is a software package designed for multitrack audio processing"
arch=(i686 x86_64)
depends=('gcc' 'audiofile' 'libsamplerate' 'python')
options=('NOLIBTOOL')
source=(http://ecasound.seul.org/download/$pkgname-$pkgver.tar.gz)
url="http://www.eca.cx/ecasound/"
md5sums=('b5a4f39245e505941f26c5c2c3b80e1c')

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr --disable-alsa --disable-jack
   make || return 1
   make DESTDIR=$startdir/pkg install
}
