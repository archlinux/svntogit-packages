# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=gnu-free-fonts
pkgver=20120503
pkgrel=8
pkgdesc="A free family of scalable outline fonts"
url="https://www.gnu.org/software/freefont/"
license=(GPL3)
arch=(any)
provides=(ttf-font ttf-freefont)
replaces=('ttf-freefont<=20120503-5')
source=(https://ftp.gnu.org/gnu/freefont/freefont-otf-${pkgver}.tar.gz{,.sig})
sha256sums=('3a6c51868c71b006c33c4bcde63d90927e6fcca8f51c965b8ad62d021614a860'
            'SKIP')
validpgpkeys=('A0156C139D2DAA3B352E42CD506361DBA36FDD52')

package() {
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 freefont-$pkgver/*.otf
}

# vim:set sw=2 et:
