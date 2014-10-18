# Contributor: Antonio Rojas

pkgname=plasma-desktop
pkgver=5.1.0.1
pkgrel=2
pkgdesc='KDE Plasma Desktop'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/plasma-desktop'
license=('LGPL')
depends=('qt5-graphicaleffects' 'libxkbfile' 'libusb-compat' 'libcanberra' 'systemsettings' 'ksysguard' 'powerdevil' 'oxygen' 'kmenuedit' 'kinfocenter' 'polkit-kde-frameworks-git') # 'packagekit-qt'
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
optdepends=('plasma-nm: Network manager applet' 'kdebase-kdepasswd: to change the user password from systemsettings')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('235318be3ddaa7e842dea8b5f737aa6b')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-5.1.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# conflict with kdebase-kdepasswd
  rm "$pkgdir"/usr/share/config.kcfg/kcm_useraccount*
}
