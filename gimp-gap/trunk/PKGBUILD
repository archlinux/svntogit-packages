# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-gap
pkgver=2.4.0
pkgrel=1
pkgdesc="A Plug-In collection to edit and create animations for the Gimp"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gimp.org/downloads/"
depends=('gimp>=2.4.4' 'xvidcore' 'bash')
source=(ftp://ftp.gimp.org/pub/gimp/plug-ins/v2.4/gap/$pkgname-$pkgver.tar.bz2)
md5sums=('b3e8eb56cc3d94325a81266a2d95fa39')

build() {
  cd $startdir/src/$pkgname-$pkgver
    #Arch64 fix
  if [ "$CARCH" = "x86_64" ]; then 
    ./configure --prefix=/usr CFLAGS="$CFLAGS -fPIC"
  else
    ./configure --prefix=/usr 
  fi

  make || return 1
  make DESTDIR=$startdir/pkg install
}
