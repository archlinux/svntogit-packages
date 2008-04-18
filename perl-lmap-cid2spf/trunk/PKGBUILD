# $Id$
# Maintainer: kevin Piche <kevin@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>

pkgname=perl-lmap-cid2spf
_realname=LMAP-CID2SPF
pkgver=0.9
pkgrel=3
pkgdesc="Convert between the two LMAP formats Microsoft's CID and SPF"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://spf.pobox.com/"
depends=('perlxml' 'perl>=5.10.0')
options=(!emptydirs)
source=(http://www.baschny.de/spf/${_realname}-${pkgver}.tar.gz)
md5sums=('d0c31d773d840c859b582990137b0b5a')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
