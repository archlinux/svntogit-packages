# $Id$
# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=lightdm-kde-greeter
pkgver=0.3.2.2
pkgrel=3
pkgdesc='KDE greeter for LightDM'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/base/lightdm'
license=('GPL')
depends=('kdebase-runtime' 'liblightdm-qt4')
makedepends=('cmake' 'automoc4')
backup=('etc/lightdm/lightdm-kde-greeter.conf'
        'etc/dbus-1/system.d/org.kde.kcontrol.kcmlightdm.conf')
source=("http://download.kde.org/unstable/${pkgname%-*}/src/${pkgname%%-*}-${pkgver}.tar.bz2"
        'findlightdm.patch'
        'lightdm-kde-greeter.conf')
sha256sums=('7948ef6a5f6639abd61be02cbdf886823b0d227b4411361737d1a44cca606b09'
            '9a042204df841f93a817c0613284bb09006e5dc4af910648025e7ab1bb56e114'
            'a8fe10ef68d553781b91b1377106f95915c3ca14d835bd66910e08f922ef64c8')

prepare() {
  cd lightdm-0.3.2.1

  sed 's/sbin/bin/' -i greeter/CMakeLists.txt
  patch -Np1 -i ../findlightdm.patch
}

build() {
  cd lightdm-0.3.2.1

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd lightdm-0.3.2.1/build

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/etc/lightdm
  install -m 644 ../../lightdm-kde-greeter.conf "${pkgdir}"/etc/lightdm/lightdm-kde-greeter.conf
}

# vim ts=2 sw=2 et:
