# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=enlightenment
pkgver=0.16.8.12
_themever=0.16.8.0.2
pkgrel=1
pkgdesc="A fast, flexible, and very extensible Window Manager"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('freetype2' 'libxinerama' 'libxft' 'libsm' 'libxxf86vm' 'esd' 'imlib2' 'perl' 'libxcomposite' 'libxdamage' 'libxrandr')
makedepends=('xbitmaps')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/e16-$pkgver.tar.gz \
        http://downloads.sourceforge.net/enlightenment/e16-themes-${_themever}.tar.gz \
        e_gen_menu.patch)
md5sums=('86e2e83bb77f3879b2bad4ff23d5d11d' '20fbaff803c3decdf3ac7c363b37c42e'\
         '56c2d0c53803a659c3846fc4aa359f14')
sha1sums=('f2792b60a254405b1352ce965dc2dc233a1d619f'
          '44dd62c5a476561c7ab4382ddd0250a5a0902065'
          '4ae92721c2e3e30698f06537e8da6b3f402b82a1')

build() {
  cd $startdir/src/e16-$pkgver
  patch -Np0 -i $startdir/src/e_gen_menu.patch || return 1
  sed -i 's|xsessiondir = $(datadir)/xsessions|xsessiondir = /etc/X11/sessions|' misc/Makefile.in
  ./configure --prefix=/usr --enable-fsstd --enable-sound --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 $startdir/pkg/usr/share/e16/misc/Xclients.e16-gnome.sh $startdir/pkg/usr/bin/e16-gnome
  install -D -m755 $startdir/pkg/usr/share/e16/misc/Xclients.e16-kde.sh $startdir/pkg/usr/bin/e16-kde
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  install -D -m644 man/e16.1 $startdir/pkg/usr/share/man/man1/e16.1

  cd $startdir/src/e16-themes-${_themever}
  ./configure --prefix=/usr --enable-fsstd
  make DESTDIR=$startdir/pkg install
 
  chown -R root:root $startdir/pkg/usr/share/*
}
