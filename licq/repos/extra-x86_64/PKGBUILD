# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
pkgname=licq
pkgver=1.3.5
pkgrel=2
pkgdesc="Advanced graphical ICQ clone and more for Unix" 
arch=(i686 x86_64)
url="http://www.licq.org"
license=('GPL')
depends=('libxss' 'qt3' 'openssl' 'bash')
source=(http://heanet.dl.sourceforge.net/sourceforge/licq/licq-$pkgver.tar.bz2)
md5sums=('842a73c82980721961fe824f40377292')

build() {
  cd $startdir/src/$pkgname-$pkgver
  . /etc/profile.d/qt3.sh
  # licq
  ./configure --prefix=/usr --enable-gpgme=no 
  make || return 1
  make DESTDIR=$startdir/pkg install

  # qt-guiA
  cd plugins/qt-gui
  # for some reason, --without-kde makes ./configure think that
  # the QT libs are missing.  ???
  ./configure --prefix=/usr  
  make || return 1
  cd po
  lrelease *.ts || return 1
  cd -
  make DESTDIR=$startdir/pkg install
  rm -rf $startdir/pkg/opt
  find $startdir/pkg -name "*.la" -exec rm -f {} \;
}
