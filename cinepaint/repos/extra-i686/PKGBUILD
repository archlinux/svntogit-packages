# $Id$
# Maintainer: tobias [tobias.archlinux.org]
# Contributor: tobias [tobias.justdreams.de]

pkgname=cinepaint
_srcver=0.22-1
pkgver=`echo $_srcver | sed 's:-:.:g'`
pkgrel=1
pkgdesc="sophisticated graphics manipulation programm supporting >8bit pictures"
arch=(i686 x86_64)
license=('LGPL' 'GPL' 'MIT-OSI')
url=(http://cinepaint.org.sourceforge.net/)
depends=('gtk2>=2.10.11' 'openexr>=1.4' 'lcms>=1.16' 'libxmu>=1.0.3' \
         'libxpm>=3.5.6' 'fltk>=1.1.7')
makedepends=('python>=2.5' 'gutenprint>=5.0')
options=('!libtool')
install=$pkgname.install
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-${_srcver}.tar.gz)
md5sums=('f360587240db6b6d2f0bfd94c420c492')

build() {
  cd $startdir/src/$pkgname-$_srcver
 # FIXES
  find plug-ins/print -type f -exec \
    sed -i "s:gutenprintui/gutenprintui:gutenprintui2/gutenprintui:" {} \;
 # build
  ./configure --prefix=/usr \
    --enable-gtk2 --enable-pygimp \
    --with-python=/usr/bin/python2.5
 # FIXES
  sed -i 's/^\(X_LIBS.*\)$/\1 -lpthread/' plug-ins/openexr/Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 $pkgname.desktop \
    $startdir/pkg/usr/share/applications/$pkgname.desktop
  install -D -m644 $pkgname.png \
    $startdir/pkg/usr/share/pixmaps/$pkgname.png
}
