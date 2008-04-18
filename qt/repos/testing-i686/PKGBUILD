# $Id$
# Contributer: Vinay S Shastry (vinayshastry@gmail.com)
pkgname=qt
pkgver=4.3.4
pkgrel=1
pkgdesc="The QT gui toolkit."
arch=('i686' 'x86_64')
url="http://www.trolltech.com/products/qt"
license=('GPL2')
options=('!libtool' 'docs')
depends=('libpng' 'libjpeg' 'libxi' 'libxcursor' 'libxinerama' 'mesa' \
         'fontconfig' 'libxrandr' 'dbus' 'glib2')
makedepends=('mysql' 'postgresql' 'unixodbc' 'libmng' 'libtiff')
provides=("qt4=${pkgver}")
replaces=('qt4')
conflicts=('qt4')
_pkgfqn=qt-x11-opensource-src-$pkgver
source=("ftp://ftp.trolltech.com/qt/source/${_pkgfqn}.tar.gz" \
        'qt-x11-opensource-src-4.3.4-aliasing.patch' \
        'qt4-assistant.desktop' 'qt4-designer.desktop' 'qt4-linguist.desktop')
md5sums=('9499101ec54eb7b0de195b3c5e3ffa93'
         '73871785cfc4c0271eca59e658ab3a44'
         '67adab60dd87270e733d25552a826950'
         '40a36635b14c32bd2923e408c2e877bf'
         'cd6e1c951e079e2eace67bce5e63966c')

build() {
  unset QMAKESPEC
  export QT4DIR=$startdir/src/$_pkgfqn
  export PATH=${QT4DIR}/bin:${PATH}
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}
  cd $startdir/src/$_pkgfqn

  patch -p1 -i ../qt-x11-opensource-src-4.3.4-aliasing.patch || return 1

  # remove docs
  rm -rf doc

  # remove unwanted mkspecs
  rm -rf mkspecs/{*aix*,*bsd*,darwin*,hpux*,hurd*,irix*,lynxos*,macx*,sco*,solaris*,tru64*,unixware*,win32*}
  rm -rf mkspecs/qws/{*bsd*,linux-{arm,cellon,ipaq,mips,sharp,zylonite}*,mac*,solaris*}

  # start compiling qt
  sed -i 's|-cp -P -f|-cp -L -f|' qmake/Makefile.unix
  sed -i "s|-O2|$CXXFLAGS|" mkspecs/common/g++.conf
  # do not compile demos and examples
  sed -i 's|CFG_NOBUILD_PARTS=""|CFG_NOBUILD_PARTS="demos examples"|' configure

  ./configure -confirm-license \
    -prefix /usr \
    -docdir /usr/share/doc/qt \
    -plugindir /usr/lib/qt/plugins \
    -datadir /usr/share/qt \
    -translationdir /usr/share/qt/translations \
    -sysconfdir /etc/qt \
    -examplesdir /usr/share/doc/qt/examples \
    -demosdir /usr/share/doc/qt/demos \
    -release \
    -platform linux-g++ \
    -system-zlib \
    -system-libpng \
    -system-libjpeg \
    -qt-gif \
    -shared -sm -nis -stl \
    -plugin-sql-{mysql,psql,sqlite,odbc} \
    -no-separate-debug-info \
    -glib -qdbus \
    -optimized-qmake \
    -fast || return 1

  make || return 1
  make INSTALL_ROOT=$startdir/pkg install || return 1

  # install images and .desktop files
  mkdir $startdir/pkg/usr/share/{pixmaps,applications}
  cp tools/assistant/images/{linguist,designer,assistant}.png $startdir/pkg/usr/share/pixmaps
  cp $startdir/src/qt4-{linguist,designer,assistant}.desktop $startdir/pkg/usr/share/applications

  # lots of cleanup and path fixes - thanks to crazy (frugalware)
  find $startdir/pkg/usr/lib -type f -name '*prl' -print -exec sed -i -e "/^QMAKE_PRL_BUILD_DIR/d" {} \;
  sed -i -e "s|-L$startdir/src/${_pkgfqn}/lib||g" $startdir/pkg/usr/lib/pkgconfig/*.pc
  #sed -i -e "s|-L$startdir/src/${_pkgfqn}/lib||g" $startdir/pkg/usr/lib/*.prl $startdir/pkg/usr/share/doc/qt/demos/shared/libdemo_shared.prl
  sed -i -e "s|$startdir/src/${_pkgfqn}/bin/moc|/usr/bin/moc|g" $startdir/pkg/usr/lib/pkgconfig/*.pc
  sed -i -e "s|$startdir/src/${_pkgfqn}/bin/uic|/usr/bin/uic|g" $startdir/pkg/usr/lib/pkgconfig/*.pc
}