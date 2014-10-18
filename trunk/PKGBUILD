# Contributor: Antonio Rojas
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgname=plasma-workspace
pkgver=5.1.0.1
pkgrel=1
pkgdesc='KDE Plasma Workspace'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/plasma-workspace'
license=('LGPL')
depends=('qt5-tools' 'kded' 'kwin' 'libksysguard' 'kjsembed' 'knotifyconfig' 'ktexteditor' 'kde-cli-tools' 'kio-extras' 
'milou' 'baloo-frameworks' 'libkscreen-frameworks' 'breeze' 'gpsd' 'libqalculate' 'khelpcenter') # 'prison-qt5'
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
optdepends=('plasma-workspace-wallpapers: additional wallpapers')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('1f9d20ffca60668cec208d5131c6bc26')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-5.1.0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  sed 's:qtpaths:qtpaths-qt5:' -i "$pkgdir"/usr/bin/startkde
}
