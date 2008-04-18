# $Id$
# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>
# Bug #8577 Modifications made by DaNiMoTh <jjdanimoth.aur@gmail.com>

pkgname=qscintilla
pkgver=2.1
pkgrel=3
license=('GPL')
pkgdesc="QScintilla2 is a port to Qt4 of Neil Hodgson's Scintilla C++ editor class."
arch=('i686' 'x86_64')
url="http://www.riverbankcomputing.co.uk/qscintilla/index.php"
depends=('qt')
provides=('qscintilla2')
conflicts=('qscintilla2')
replaces=('qscintilla2')
source=(http://www.riverbankcomputing.com/Downloads/QScintilla2/QScintilla-1.73-gpl-$pkgver.tar.gz)

md5sums=('13049717628391ca4db43f7ede0eeeb4')

build() {
  	cd $startdir/src/QScintilla-1.73-gpl-$pkgver/Qt4
  	sed -i "s|DESTDIR = .*|DESTDIR = $startdir/pkg/usr/lib|g" qscintilla.pro
  	sed -i "s|header.path = .*|header.path = $startdir/pkg/usr/include|g" qscintilla.pro
  	sed -i "s|trans.path = .*|trans.path = $startdir/pkg/usr/share/qt/translations|g" qscintilla.pro
    sed -i "s|qsci.path = .*|qsci.path = $startdir/pkg/usr/share/qt/translations|g" qscintilla.pro
    qmake qscintilla.pro
    sed -i 's|$(MOVE) $(TARGET)|$(COPY) $(TARGET)|g' Makefile
    make || return 1
    make DESTDIR=$startdir/pkg install
    rm -rf $startdir/pkg/usr/lib/libqscintilla2.so.2 
    pushd $startdir/pkg/usr/lib/
    ln -s libqscintilla2.so.2.2 libqscintilla2.so.2
    popd
    
    cd ../designer-Qt4

    # Qt4 designer qscintilla2 plugin
    mkdir -p $startdir/pkg/usr/lib/qt/plugins/designer

    echo "INCPATH += ../Qt4" >> designer.pro
    sed -i "s|LIBS.*|LIBS += -L../Qt4 -lqscintilla2|g" designer.pro
    qmake designer.pro
    make || return 1
    cp libqscintillaplugin.so $startdir/pkg/usr/lib/qt/plugins/designer/
}
