# $Id$
# Contributor: Fredrik Hammar <Horney_C86@Hotmail.com>
# Maintainer: tobias <tobias@archlinux.org>

pkgname=dvdrip
pkgver=0.98.8
pkgrel=2
pkgdesc="A Gtk frontend for transcode writen in Perl"
arch=(i686 x86_64)
license=('custom')
url="http://www.exit1.org/dvdrip/"
install=${pkgname}.install
depends=('glibc' 'perl-gtk2-ex-formfactory' 'transcode' 'imagemagick'
         'perl-libintl-perl' 'desktop-file-utils' 'perl-event-execflow')
source=(http://www.exit1.org/dvdrip/dist/${pkgname}-${pkgver}.tar.gz \
        ${pkgname}.desktop)
options=(!emptydirs)
md5sums=('61b77b298b14c6bde83713e93e9ea4d8'
         '9c5b347c2e0ae847d0e7abb3cf54bad3')

build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/${pkgname}-${pkgver}
  # workaround a workaround that works around the RH specific NPTL handling
  #sed -i 's:2\.2\.5:2.4:' lib/Video/DVDRip/Config.pm

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
# make test is broken in a chroot
#  make test || return 1
  make install DESTDIR=${startdir}/pkg

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete

  install -Dm644 ../${pkgname}.desktop \
      ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
  install -Dm 644 COPYRIGHT \
      ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
