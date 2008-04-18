# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: Varun Acharya <ganja.guru@airtelbroadband.in>

pkgname=kdmtheme
pkgver=1.2.2
pkgrel=1
pkgdesc="A theme manager for KDM."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=22120"
license=('GPL')
depends=('kdebase' 'kdelibs>=3.4.0')
source=(http://beta.smileaf.org/files/kdmtheme/$pkgname-$pkgver.tar.bz2)
md5sums=('292188b0a74b865ec7429077ff5e02b7')

build()  {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --with-qt-libraries=/opt/qt/lib \
              --with-qt-includes=/opt/qt/include

  sed "s/aclocal-1.7/aclocal/g" -i Makefile
  sed "s/automake-1.7/automake/g" -i Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
}

