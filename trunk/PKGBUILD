# Contributor: Antonio Rojas

pkgname=breeze
pkgver=5.1.0.1
pkgrel=1
pkgdesc='Artwork, styles and assets for the Breeze visual style for the Plasma Desktop'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/breeze'
license=('LGPL')
depends=('frameworkintegration')
makedepends=('extra-cmake-modules' 'python')
optdepends=('breeze-kde4: Breeze widget style for KDE4 applications' 'oxygen-icons: fallback icon theme')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('548aa4ac6e1ae8b3ff5756cb15d2ecc4')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# make QtCurve preset and color scheme available for KDE4 too
  install -d -m755 "$pkgdir"/usr/share/apps/{QtCurve,color-schemes}
  ln -sr "$pkgdir"/usr/share/QtCurve/Breeze.qtcurve "$pkgdir"/usr/share/apps/QtCurve
  ln -sr "$pkgdir"/usr/share/color-schemes/Breeze*.colors "$pkgdir"/usr/share/apps/color-schemes
}
