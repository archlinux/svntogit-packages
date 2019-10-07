# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=noto-fonts
pkgname=(noto-fonts noto-fonts-extra ttf-croscore)
pkgver=20190926
_commit=0fa1dfabd6e3746bb7463399e2813f60d3f1b256
pkgrel=2
pkgdesc="Google Noto TTF fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=("$pkgbase-$_commit.tar.gz::https://github.com/googlei18n/noto-fonts/archive/$_commit.tar.gz"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf)
sha256sums=('6ca2938b99e4316c6eabdab498f577efb979c4f2aeaf5a3a357ab4e3dcc2c2a5'
            '65ff237a579d438eb1b1c90bf25b5818e15ab019dbbfed2fc283b9cd12e5177f'
            '27419c0557d05e13edbb244cd06a62d921c271c6c2f07126856519869035776e'
            'a253b752fa0a0c3ff311e8cc0410788bfc61292dc3517c5a5a315c7a54fb9beb')

package_noto-fonts() {
  optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
              'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
  provides=(ttf-font)

  cd $pkgbase-*/
  install -Dm644 unhinted/Noto*/*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
  install -Dm644 hinted/Noto*/*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/noto-fonts

  # Move to noto-fonts-extra
  rm -f "$pkgdir"/usr/share/fonts/noto/Noto*{Condensed,SemiBold,Extra}*.ttf

  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/etc/fonts/conf.avail/
  install -d "$pkgdir"/etc/fonts/conf.d
  ln -rs "$pkgdir"/etc/fonts/conf.avail/* "$pkgdir"/etc/fonts/conf.d

  # Remove font that breaks emoji in Qt
  rm "$pkgdir"/usr/share/fonts/noto/NotoKufiArabic*
}

package_noto-fonts-extra() {
  pkgdesc+=' - additional variants'
  depends=(noto-fonts)
  
  cd $pkgbase-*/
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  cp hinted/Noto*/*{Condensed,SemiBold,Extra}*.tt[fc] "$pkgdir"/usr/share/fonts/noto
}

package_ttf-croscore() {
  pkgdesc='Chrome OS core fonts'
  provides=(ttf-font)

  cd $pkgbase-*/
  install -Dm644 hinted/{Arimo,Cousine,Tinos}/*.ttf -t "$pkgdir"/usr/share/fonts/croscore
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/ttf-croscore
}
