# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=noto-fonts
pkgname=(noto-fonts noto-fonts-extra ttf-croscore)
pkgver=20190111
_commit=c30307083469f0c05e216ac75216fd454a517858  # master
pkgrel=2
pkgdesc="Google Noto TTF fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=("$pkgbase-$_commit.tar.gz::https://github.com/googlei18n/noto-fonts/archive/$_commit.tar.gz"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf)
sha256sums=('2c55a0422a8d51425dc2f000e7c67139f1d2756ee93568389bdeb8e2c51e1934'
            '65ff237a579d438eb1b1c90bf25b5818e15ab019dbbfed2fc283b9cd12e5177f'
            '27419c0557d05e13edbb244cd06a62d921c271c6c2f07126856519869035776e'
            'a253b752fa0a0c3ff311e8cc0410788bfc61292dc3517c5a5a315c7a54fb9beb')

package_noto-fonts() {
  optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
              'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
  provides=(ttf-font)

  cd $pkgbase-*/
  install -Dm644 unhinted/Noto*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
  install -Dm644 hinted/Noto*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/noto-fonts

  # Move to noto-fonts-extra
  rm -f "$pkgdir"/usr/share/fonts/noto/Noto*{Condensed,SemiBold,Extra}*.ttf

  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/etc/fonts/conf.avail/
  install -d "$pkgdir"/etc/fonts/conf.d
  ln -rs "$pkgdir"/etc/fonts/conf.avail/* "$pkgdir"/etc/fonts/conf.d
}

package_noto-fonts-extra() {
  pkgdesc+=' - additional variants'
  depends=(noto-fonts)
  
  cd $pkgbase-*/
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  cp hinted/Noto*{Condensed,SemiBold,Extra}*.tt[fc] "$pkgdir"/usr/share/fonts/noto
}

package_ttf-croscore() {
  pkgdesc='Chrome OS core fonts'
  provides=(ttf-font)

  cd $pkgbase-*/
  install -Dm644 hinted/{Arimo,Cousine,Tinos}*.ttf -t "$pkgdir"/usr/share/fonts/croscore
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/ttf-croscore
}
