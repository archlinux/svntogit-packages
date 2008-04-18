# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Jake VanderKolk <jakevanderkolk@gmail.com>

pkgname=gtk-qt-engine
pkgver=0.8
pkgrel=2
pkgdesc="A GTK engine which makes your GTK2 Apps match your QT theme"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libbonoboui' 'qt3' 'gtk2>=2.10.0' 'kdelibs>=3.5.7')
makedepends=('cmake>=2.4.7')
source=("http://gtk-qt.ecs.soton.ac.uk/files/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
url="http://gtk-qt.ecs.soton.ac.uk/"

build() {
  cd ${startdir}/src/${pkgname} #-${pkgver}
  . /etc/profile.d/qt3.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/lib/gtk-2.0/*/engines/*.la
  # bug 4998
  #rm ${startdir}/pkg/usr/share/applications/kcmgtk-xdg.desktop
}
