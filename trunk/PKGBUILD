# $Id$
# Maintainer: kevin <kevin@archlinux.org>

pkgname=perl-file-mimeinfo
_realname=File-MimeInfo
pkgver=0.14
pkgrel=3
pkgdesc='Perl/CPAN File::MimeInfo module - Determine file type'
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-file-basedir' 'perl-file-desktopentry' 'shared-mime-info'
'perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PA/PARDUS/${_realname}/${_realname}-${pkgver}.tar.gz)
md5sums=('b4cb0ea1a30730c24747199784d90968')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
