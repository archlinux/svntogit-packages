# Maintainer: Varun Acharya <varun@archlinux.org>

pkgname=showimg
pkgver=0.9.5
pkgrel=5
pkgdesc="ShowImg is a feature-rich image viewer for KDE which can display numerous formats."
arch=('i686' 'x86_64')
url="http://www.jalix.org/projects/showimg/"
license="GPL"
depends=('kdebase' 'libpqxx' 'libkexif' 'libkipi')
source=(http://www.jalix.org/projects/showimg/download/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('281c5f5e65ca14c69810d2099c43a4b8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's/all.h/pqxx/' showimg/kexi/kexidb/drivers/pqxx/pqxxcursor.h || return 1
  sed -i 's/all.h/pqxx/' showimg/kexi/kexidb/drivers/pqxx/pqxxconnection.h || return 1
  sed -i "s/return QString(pqxx::Quote(str.ascii()).c_str());/ return \"\'\"+QString(pqxx::sqlesc(str.ascii()).c_str())+\"\'\";/" showimg/kexi/kexidb/drivers/pqxx/pqxxdriver.cpp || return 1
  sed -i "s/return QCString(pqxx::Quote(QString(str).ascii()).c_str());/return \"\'\"+QCString(pqxx::sqlesc(QString(str).ascii()).c_str())+\"\'\";/" showimg/kexi/kexidb/drivers/pqxx/pqxxdriver.cpp || return 1
  sed -i 's/statement.utf8()/statement.utf8().data()/' showimg/kexi/kexidb/drivers/pqxx/pqxxconnection.cpp || return 1
  sed -i 's/statement.utf8()/statement.utf8().data()/' showimg/kexi/kexidb/drivers/pqxx/pqxxcursor.cpp || return 1
  ./configure --prefix=/opt/kde --enable-libkipi --with-kexif --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install
} 
