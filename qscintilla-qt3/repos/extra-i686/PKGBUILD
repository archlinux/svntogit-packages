# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: red_over_blue,Ben <ben@benmazer.net>,Kritoke <kritoke@gamebox.net>

pkgname=qscintilla-qt3
pkgver=1.7.1
pkgrel=2
pkgdesc="QScintilla is a port to Qt3 of Neil Hodgson's Scintilla C++ editor class."
arch=(i686 x86_64)
url="http://www.riverbankcomputing.co.uk/qscintilla/index.php"
depends=('qt3')
pkgurl="http://www.river-bank.demon.co.uk/download/QScintilla/"
source=(http://www.riverbankcomputing.com/Downloads/QScintilla1/QScintilla-1.71-gpl-$pkgver.tar.gz)
build() {
  source /etc/profile.d/qt3.sh
  cd $startdir/src/QScintilla-1.71-gpl-$pkgver
  cd qt
  echo [STARTING sed on qscintilla.pro]
  sed -i "s%DESTDIR.*%DESTDIR=$startdir/pkg/opt/qt/lib%g" qscintilla.pro
  /opt/qt/bin/qmake qscintilla.pro || return 1
  make || return 1
  # installind includes
  for i in qextscintilla*.h
  do
  install -m 644 -D $i $startdir/pkg/opt/qt/include/$i
  done
  
  #for i in qscintilla*.qm
  #do
  #install -m 644 -D $i $startdir/pkg/opt/qt/translations/$i
  #done
}
md5sums=('dfa047b45d4f09ae8d4a8a431ba88a5a')
