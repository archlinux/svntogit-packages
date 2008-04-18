# $Id$
# Contributor: Aurelien Gateau <aurelien.gateau@free.fr>
# Maintainer: damir <damir@archlinux.org>

pkgname=gwenview
pkgver=1.4.2
pkgrel=2
pkgdesc="An image viewer for KDE"
arch=("i686" "x86_64")
license=('GPL2')
url="http://gwenview.sourceforge.net"
groups=("kde")
depends=('kdelibs>=3.5.7' 'exiv2>=0.16' 'libkipi' 'libmng')
source=("http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('33c3fc68224d57f5f5cc4d34b48293c6')

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde \
   	       --enable-final
#   make LIBEXIF_CFLAGS="-I/usr/include/libexif" || return 1  
   # libexif: see http://bugs.kde.org/show_bug.cgi?id=129788
   make DESTDIR=$startdir/pkg install || return 1
}

# .la files are essential for kpart to work - do NOT eliminate .la files from this pkg!

