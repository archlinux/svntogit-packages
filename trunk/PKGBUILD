# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=perl-mail-spf
_realname=Mail-SPF
pkgver=2.005
pkgrel=2
pkgdesc="Perl module that provides SPF support"
arch=(i686 x86_64)
license=('custom')
url="http://search.cpan.org/dist/${_realname}/"
makedepends=('perl-net-dns-resolver-programmable')
depends=('perl-error' 'perl-netaddr-ip' 'perl-uri' 'perl-net-dns'
'perl>=5.10.0')
conflicts=('perl-mail-spf-query')
source=(http://search.cpan.org/CPAN/authors/id/J/JM/JMEHNLE/mail-spf/${_realname}-v${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('a5129d56539edf90749afacea70621ac')

build() {
  cd ${startdir}/src/${_realname}-v${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name 'perllocal.pod' -delete

  install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
