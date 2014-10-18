# Contributor: Antonio Rojas

pkgname=kio-extras
pkgver=5.1.0.1
pkgrel=1
pkgdesc="Additional components to increase the functionality of KIO"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kio-extras'
license=('LGPL')
depends=('kdelibs4support' 'khtml' 'kdnssd' 'libssh' 'smbclient' 'exiv2' 'openexr')
makedepends=('extra-cmake-modules' 'openslp' 'kdoctools' 'python')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('fe8771bd6157bd842753d0c2a3c9162c')

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
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# conflicts with kdebase-runtime
  rm "$pkgdir"/usr/lib/libmolletnetwork.so
  mv "$pkgdir"/usr/share/config.kcfg/jpegcreatorsettings{,5}.kcfg
}

