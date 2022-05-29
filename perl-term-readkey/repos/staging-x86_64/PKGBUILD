# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Francois Charette <francois.archlinux.org>

pkgname=perl-term-readkey
_realname=TermReadKey
pkgver=2.38
pkgrel=7
pkgdesc="Provides simple control over terminal driver modes"
arch=('x86_64')
license=('custom')
depends=('perl' 'glibc')
url="https://search.cpan.org/~jstowe/${_realname}/"
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/J/JS/JSTOWE/${_realname}-$pkgver.tar.gz)
sha512sums=('fb09f013f9f0d8a4397e39f6f3db7a6d023259219af8f76744094e396437a01b19141b3cdb39a158d3b518903fb010088bc37406763bfbeb3fcab810bb0bb157')

build() {
  cd "${srcdir}/TermReadKey-$pkgver"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/TermReadKey-$pkgver"
  make test
}

package() {
  cd "${srcdir}/TermReadKey-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  head -7 README > "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
