# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=pambase
pkgver=20190105.1
pkgrel=1
pkgdesc="Base PAM configuration for services"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
source=('system-auth'
        'system-local-login'
        'system-login'
        'system-remote-login'
        'system-services'
        'other')
backup=('etc/pam.d/system-auth'
        'etc/pam.d/system-local-login'
        'etc/pam.d/system-login'
        'etc/pam.d/system-remote-login'
        'etc/pam.d/system-services'
        'etc/pam.d/other')
sha256sums=('3eb67872e436817ec97c4f3795adba2cf1d3829ea4e107ef5747569e4eeb5746'
            '005736b9bd650ff5e5d82a7e288853776d5bb8c90185d5774c07231c1e1c64a9'
            '1e5dd7dd31a81381f4a00179844bd45f15e4ead46cc4d5a1a0f2c0701189829b'
            '005736b9bd650ff5e5d82a7e288853776d5bb8c90185d5774c07231c1e1c64a9'
            '6eb1acdd3fa9f71a7f93fbd529be57ea65bcafc6e3a98a06af4d88013fc6a567'
            'd5ed59ec2157c19c87964a162f7ca84d53c19fb2bd68d3fbc1671ba8d906346f')

package() {
  install -dm755 "$pkgdir/etc/pam.d"
  install -m644 -t "$pkgdir/etc/pam.d" "${source[@]}"
}

# vim:set ts=2 sw=2 et:
