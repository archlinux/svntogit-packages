# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=iwlwifi-3945-ucode
pkgver=2.14.1.5
pkgrel=2
pkgdesc="Intel wireless firmware for IPW3945 (iwlwifi driver)"
arch=(i686 x86_64)
url="http://intellinuxwireless.org/?p=iwlwifi"
license=('custom')
depends=()
source=(http://intellinuxwireless.org/iwlwifi/downloads/$pkgname-2.14.4.tgz
        http://intellinuxwireless.org/iwlwifi/downloads/$pkgname-$pkgver.tgz)
md5sums=('7178aa3a6e08655b8ac9565095bbd441'
         'a8122d3e026561055f488dc654ccfcd1')
force=y

build() {
  cd $startdir/src/$pkgname-2.14.4
  # Install old firmware for compatibility
  install -D -m 644 iwlwifi-3945.ucode $startdir/pkg/lib/firmware/iwlwifi-3945.ucode || return 1

  cd $startdir/src/$pkgname-$pkgver
  # Install firmware
  install -D -m 644 iwlwifi-3945-1.ucode $startdir/pkg/lib/firmware/iwlwifi-3945-1.ucode || return 1
  # Install license
  install -D -m 644 LICENSE.iwlwifi-3945-ucode $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1
}
