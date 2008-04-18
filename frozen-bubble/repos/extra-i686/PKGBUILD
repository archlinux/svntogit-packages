# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributer: Brandon Niemczyk <maccorin@cfl.rr.com>

pkgname=frozen-bubble
pkgver=2.1.0
pkgrel=2
pkgdesc="A game in which you throw colorful bubbles and build groups to destroy the bubbles"
arch=(i686 x86_64)
url="http://www.frozen-bubble.org"
depends=('sdl_perl' 'sdl_mixer' 'perl-locale-gettext' 'sdl_pango')
makedepends=('imagemagick')
source=(http://www.frozen-bubble.org/data/${pkgname}-${pkgver}.tar.bz2 \
        frozen-bubble.desktop)
md5sums=('f5eb984897e1ccd52a0d8820d8359861' '3e0755836580e374e0911653f8cd33e2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/gfx/balls
  # Fix missing files for colourblind
  for g in bubble-colourblind-?.gif; do
    convert -depth 8 -scale 16x16 ${g} ${g/%.gif/-mini.png}
  done
  cd ../..
  make OPTIMIZE="${CFLAGS}" \
       CFLAGS="$(pkg-config glib-2.0 --cflags)" INSTALLDIRS=vendor \
       PREFIX=/usr || return 1
 
  make DESTDIR=${startdir}/pkg PREFIX=/usr install || return 1
  install -D -m644 icons/frozen-bubble-icon-64x64.png ${startdir}/pkg/usr/share/pixmaps/frozen-bubble.png || return 1
  install -D -m644 ${startdir}/src/frozen-bubble.desktop ${startdir}/pkg/usr/share/applications/frozen-bubble.desktop || return 1
}
