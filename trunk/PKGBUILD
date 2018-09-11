# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=adobe-source-code-pro-fonts
pkgver=2.030ro+1.050it
_relver=2.030R-ro/1.050R-it
pkgrel=4
pkgdesc="Monospaced font family for user interface and coding environments"
url="https://adobe-fonts.github.io/source-code-pro/"
arch=(any)
license=(custom)
_tarname=source-code-pro-${_relver//\//-}
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/source-code-pro/archive/$_relver.tar.gz")
sha256sums=('a4e4dd59b8e0a436b934f0f612c2e91b5932910c6d1c3b7d1a5a9f389c86302b')

package() {
  cd $_tarname
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 OTF/*.otf
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
