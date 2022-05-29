# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-file-which
_realname=File-Which
pkgver=1.27
pkgrel=2
pkgdesc="Portable implementation of which"
arch=(any)
url="https://metacpan.org/dist/$_realname"
license=(GPL PerlArtistic)
depends=(perl)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_realname-$pkgver.tar.gz")
sha256sums=('3201f1a60e3f16484082e6045c896842261fc345de9fb2e620fd2a2c7af3a93a')

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 et:
