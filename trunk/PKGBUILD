# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gyp
pkgver=20220404.9ecf45e3
pkgrel=2
pkgdesc='"Generate Your Projects" Meta-Build system'
url="https://gyp.gsrc.io/"
arch=(any)
license=(custom:BSD)
depends=(python-six ninja)
makedepends=(git python-setuptools)
_commit=9ecf45e37677743503342ee4c6a76eaee80e4a7f  # changes/24/3562924/3
source=("git+https://chromium.googlesource.com/external/gyp#commit=$_commit"
        0001-gyp-python38.patch
        0002-gyp-fix-cmake.patch
        0003-gyp-fips.patch)
sha256sums=('SKIP'
            '7fb04acbac92a1d173c2bc3022b7814a711427225a7fd32912dc60f1e1a6746e'
            '8a9f1a413b943dd469f981ee5fa7b7cc372e3cd9e9f0ecf9640d4f0f6bb29647'
            'dda2c6717d52a9dd53ce5b4985115f947dcca2bce3a207bd9c543976c41decf5')

pkgver() {
  cd gyp

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd gyp

  # Python 3 fixes from Fedora
  git apply -3 ../*.patch
}

build() {
  cd gyp
  python setup.py build
}

package() {
  cd gyp
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
