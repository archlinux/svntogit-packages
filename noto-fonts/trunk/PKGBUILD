# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=noto-fonts
pkgname=(noto-fonts noto-fonts-extra ttf-croscore)
pkgver=20201206
_commit=20bc5918912503bc1537a407a694738c33c048aa
pkgrel=1
pkgdesc="Google Noto TTF fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=("$pkgbase-$_commit.tar.gz::https://github.com/googlei18n/noto-fonts/archive/$_commit.tar.gz"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf
        46-noto-sans.conf 46-noto-serif.conf 46-noto-mono.conf)
sha256sums=('f7a466624e5cc6893833ceb9c30223b7630bae967391c3abae6cd011b359d859'
            '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69'
            '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
            '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
            '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
            'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
            'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884')

package_noto-fonts() {
  optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
              'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
  provides=(ttf-font)

  cd $pkgbase-*/
  install -Dm644 unhinted/ttf/Noto*/*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
  install -Dm644 hinted/ttf/Noto*/*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
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
  cp hinted/ttf/Noto*/*{Condensed,SemiBold,Extra}*.tt[fc] "$pkgdir"/usr/share/fonts/noto
}

package_ttf-croscore() {
  pkgdesc='Chrome OS core fonts'
  provides=(ttf-font)

  cd $pkgbase-*/
  install -Dm644 hinted/ttf/{Arimo,Cousine,Tinos}/*.ttf -t "$pkgdir"/usr/share/fonts/croscore
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/ttf-croscore
}
