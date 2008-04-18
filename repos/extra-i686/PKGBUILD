# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=perl-tk
_realname=Tk
#stable pkgver=804.027
pkgver=804.028
pkgrel=1
pkgdesc="This module/script allows perl to interface with tk"
license=('PerlArtistic' 'GPL' 'custom')
arch=(i686 x86_64)
depends=('libx11' 'libpng' 'libjpeg' 'tk' 'perl>=5.10.0')
#
# Using an "unauthorized" version because the official
# release does not build under perl 5.10
#source=(http://cpan.org/authors/id/N/NI/NI-S/${_realname}-${pkgver}.tar.gz)
#
source=(http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/${_realname}-${pkgver}.tar.gz)
md5sums=('7153c1c411b0dd005a0660179e5c5900')
url="http://search.cpan.org/dist/${_realname}/"
options=(!emptydirs)
replaces=('perltk')
provides=('perltk')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  /bin/chmod -R u+w *
  make || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete

  # license
  install -D -m644 pTk/license.terms \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/tk.license
  install -D -m644 pTk/Tix.license \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/tix.license
}
# vim: ts=2 sw=2 et ft=sh
