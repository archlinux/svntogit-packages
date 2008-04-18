# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=sdl_perl
_realname=SDL_Perl
pkgver=2.1.3
pkgrel=2
pkgdesc="A Perl wrapper for SDL"
arch=(i686 x86_64)
license=('LGPL')
url="http://sdl.perl.org"
depends=('perl>=5.10.0' 'sdl_net' 'sdl_ttf' 'sdl_image' 'sdl_mixer' 'mesa'
'sdl_gfx' 'smpeg')
makedepends=('perl-yaml')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/D/DG/DGOEHRIG/${_realname}-${pkgver}.tar.gz)
md5sums=('6ce26e1b710ce52def4ec22637cd5176')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  perl Build.PL installdirs=vendor destdir=${startdir}/pkg \
                --config man1ext=1p --config man3ext=3pm
  perl Build
  perl Build install

  # Fix bad location of libraries.
  cd ${startdir}/pkg/usr/lib/perl5/vendor_perl
  mv -f auto/src/SDL* auto
  rmdir auto/src
}
