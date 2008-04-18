# $Id$
# Maintainer: roberto <roberto@archlinux.org>

pkgname=artwiz-fonts
pkgver=1.3
pkgrel=3
pkgdesc="This is set of (improved) artwiz fonts."
url="http://fluxbox.sourceforge.net/artwiz-aleczapka/readme.htm"
depends=(xorg-fonts-encodings xorg-font-utils fontconfig)
install=artwiz-fonts.install
source=(http://dl.sourceforge.net/sourceforge/artwizaleczapka/artwiz-aleczapka-en-${pkgver}.tar.bz2)
md5sums=(6c6c704f2f08f9d6308d366423dfa90e)

build() {
    cd ${startdir}/src/artwiz-aleczapka-en-${pkgver}
    mkdir -p ${startdir}/pkg/usr/share/fonts/artwiz-fonts
    install -m644 *.pcf ${startdir}/pkg/usr/share/fonts/artwiz-fonts/
    install -m644 fonts.alias ${startdir}/pkg/usr/share/fonts/artwiz-fonts/
}
