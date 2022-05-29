# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

pkgname=perl-file-sharedir
_realname=File-ShareDir
pkgver=1.118
pkgrel=2
pkgdesc="Locate per-dist and per-module shared files"
arch=(any)
license=(PerlArtistic GPL)
depends=(perl-class-inspector)
url="https://metacpan.org/dist/$_realname"
options=('!emptydirs')
_author=REHSACK
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/${_author}/$_realname-$pkgver.tar.gz")
sha256sums=('3bb2a20ba35df958dc0a4f2306fc05d903d8b8c4de3c8beefce17739d281c958')

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}
