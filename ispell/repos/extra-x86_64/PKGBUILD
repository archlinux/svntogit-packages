# Contributor: Eric Belanger <eric@archlinux.org>
# Maintainer:

pkgname=ispell
pkgver=3.4.05
pkgrel=1
pkgdesc="An interactive spell-checking program for Unix"
arch=('x86_64')
url="https://www.cs.hmc.edu/~geoff/ispell.html"
license=('BSD')
depends=('ncurses' 'sh')
options=('!makeflags')
source=(https://www.cs.hmc.edu/~geoff/tars/$pkgname-$pkgver.tar.gz
        cflags-from-environment.patch
        license.txt)
sha256sums=('cf0c6dede3fd25fada4375d86acafe583cb96d8fe546de746a92ebb6df895602'
            '280459d2cdb17846aab202d53089fd13469e6e59ae9e6da4a95b475597dd4603'
            '359eca8bfb77db63785c4c304ecd3568b26cdf736946388e509933fc8a3f66bd')

prepare() {
  cd ${pkgname}-${pkgver}

  # needed for full RELRO (FS#68037)
  patch -Np1 -i ../cflags-from-environment.patch

  sed -i -e 's/#undef USG/#define USG/' \
    -e 's|/usr/local|/usr|' \
    -e 's|/lib|/lib/ispell|' local.h.linux
  cp local.h.linux local.h
}

build() {
  cd ${pkgname}-${pkgver}
  make TMPDIR=/tmp all
}

package() {
  cd ${pkgname}-${pkgver}

# creating directory structure
  install -dm755 "${pkgdir}"/usr/{bin,lib/ispell,share/man/man{1,5}}

# Installing binary tools
  for b in buildhash findaffix icombine ijoin ispell iwhich munchlist tryaffix; do
    install -m755 $b "${pkgdir}"/usr/bin/
  done

# Installing man pages
  install -m644 ispell.1 "${pkgdir}"/usr/share/man/man1/ispell.1
  install -m644 ispell.5 "${pkgdir}"/usr/share/man/man5/ispell.5

# Installing dictionnaries
  install -m644 languages/american/americanmed.hash \
    "${pkgdir}"/usr/lib/ispell/americanmed.hash
  install -m644 languages/english/english.aff \
    "${pkgdir}"/usr/lib/ispell/english.aff
  ln -s americanmed.hash "${pkgdir}"/usr/lib/ispell/american.hash
  ln -s americanmed.hash "${pkgdir}"/usr/lib/ispell/english.hash

# Installing license
  install -Dm644 "${srcdir}"/license.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
