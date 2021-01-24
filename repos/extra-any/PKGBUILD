# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gyp
pkgver=20190716.fcd686f1
pkgrel=6
pkgdesc='"Generate Your Projects" Meta-Build system'
arch=(any)
url="https://gyp.gsrc.io/"
license=(custom:BSD)
depends=(python ninja)
makedepends=(git python-setuptools)
_commit=fcd686f1880fa52a1ee78d3e98af1b88cb334528  # changes/82/1701782/5
source=("git+https://chromium.googlesource.com/external/gyp#commit=$_commit"
        gyp-fips.patch gyp-fix-cmake.patch gyp-python38.patch gyp-python39.patch)
sha256sums=('SKIP'
            '43022909aa2f320bdc0cc5813734f42bd6ef2ac4372821bf5757f753c7a3c277'
            '8610250f946ee070c5182cc87cd23cdd9f66a47ec57a98049bb2aaae4a1e09e6'
            '6580f0f02f430f1ba4aa7e8e2d32203dcb3d6f07f1de5287d0fb33ab2ed1cc30'
            '06b9092eea1513a70f8c5213ba2dc7f550cf5ddf6ee0bb801ea0cda290e3a6f9')

pkgver() {
  cd $pkgname

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $pkgname

  # Python 3 fixes from Fedora
  git apply -3 ../*.patch
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
