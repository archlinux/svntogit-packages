# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=iwlwifi-4965-ucode
pkgver=4.44.1.20
pkgrel=1
pkgdesc="Intel wireless firmware for IPW4965 (iwlwifi driver)"
arch=(i686 x86_64)
url="http://intellinuxwireless.org/?p=iwlwifi"
license=('custom')
depends=()
source=(http://intellinuxwireless.org/iwlwifi/downloads/$pkgname-4.44.17.tgz
        http://intellinuxwireless.org/iwlwifi/downloads/$pkgname-$pkgver.tgz)
md5sums=('6e5e5287bc9a8021bb35e5905e891638'
         '6e5c396da265d79d5675fd345adf24cc')
force=y

build() {
  cd $startdir/src/$pkgname-4.44.17
  # Install old firmware for compatibility
  install -D -m 644 iwlwifi-4965.ucode $startdir/pkg/lib/firmware/iwlwifi-4965.ucode || return 1

  cd $startdir/src/$pkgname-$pkgver
  # Install firmware
  install -D -m 644 iwlwifi-4965-1.ucode $startdir/pkg/lib/firmware/iwlwifi-4965-1.ucode || return 1
  # Install license
  install -D -m 644 LICENSE.iwlwifi-4965-ucode $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1
}
