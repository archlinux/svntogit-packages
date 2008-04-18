# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor:  John Proctor <jproctor@prium.net>

pkgname=fluxbox
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight and highly-configurable window manager"
arch=('i686' 'x86_64')
url="http://www.fluxbox.org"
license=('MIT')
depends=('libxft' 'libxpm' 'libxinerama' 'libxrandr' 'gcc-libs' 'bash' 'imlib2')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2 \
        $pkgname.desktop)
md5sums=('990e276ead0d04421dce4080f485caca' 'eeae9c88a2526ac0bd8afcd9ce97f9ed')
sha1sums=('7985e35fbb170fda24b9e04610690cd04c7a8748' 'f3f83b8ce84d79c2f8670ef687e0dd89ab0552b8')

build() {
  cd $startdir/src/$pkgname-${pkgver}
  ./configure --prefix=/usr \
   --enable-kde --enable-gnome \
   --enable-xft --enable-xinerama \
   --enable-imlib2 --enable-nls
  make || return 1
  make DESTDIR=$startdir/pkg install
 # this is a fix to allow fluxbox to shutdown, but this can be changed by the user :-(
  sed -i 's|^.*slit\.autoHide.*$|session.screen0.slit.autoHide:  True|' \
    $startdir/pkg/usr/share/fluxbox/init
  install -D -m644 ../$pkgname.desktop \
    $startdir/pkg/etc/X11/sessions/$pkgname.desktop
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
