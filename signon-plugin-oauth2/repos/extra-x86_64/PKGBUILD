# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=signon-plugin-oauth2
_pkgname=signon-oauth2
pkgver=0.25
pkgrel=1
pkgdesc='OAuth 2 plugin for signon'
arch=(x86_64)
url="https://gitlab.com/accounts-sso/signon-plugin-oauth2"
license=(LGPL)
depends=(signond)
makedepends=(qt5-xmlpatterns)
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/accounts-sso/signon-plugin-oauth2/repository/archive.tar.gz?ref=VERSION_$pkgver")
sha256sums=('f750a1e767c1977d73895b7aa7d5dca5494e4cbc53cf57c7e6c311933701ae52')

prepare() {
  cd signon-plugin-oauth2-VERSION_$pkgver-*

  sed -i '/-Werror/d' common-project-config.pri

  # Do not install tests and example
  echo 'INSTALLS =' >>tests/tests.pro
  echo 'INSTALLS =' >>example/example.pro
}

build() {
  cd signon-plugin-oauth2-VERSION_$pkgver-*

  qmake-qt5 PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd signon-plugin-oauth2-VERSION_$pkgver-*

  make INSTALL_ROOT="$pkgdir" install
}
