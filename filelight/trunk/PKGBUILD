# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>

pkgname=filelight
pkgver=1.0
pkgrel=2
pkgdesc="A KDE program that creates a complex, but data-rich graphical representation of the files and directories on your computer."
arch=("i686" "x86_64")
url="http://methylblue.com/filelight/"
pkgurl="http://methylblue.com/filelight"
depends=('kdelibs>=3.5.4')
source=("$pkgurl/packages/$pkgname-1.0.tar.bz2") # "part.cpp.diff")

build() {
   cd $startdir/src/$pkgname-1.0
  # cd src/part
  # patch part.cpp $startdir/src/part.cpp.diff || return 1
  # cd ../..
   if [ "$CARCH" = "x86_64" ]; then
      # not the best way but gentoo patch didn't work
      export CFLAGS="$CFLAGS -fPIC"
      export CXXFLAGS="$CFLAGS"
   fi
   ./configure --prefix=/opt/kde
   make || return 1
   make DESTDIR=$startdir/pkg install || return 1
   # removing .la file breaks kparts and loading filelight module!
}

