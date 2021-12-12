# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=pambase
pkgver=20211210
pkgrel=1
pkgdesc="Base PAM configuration for services"
arch=('any')
url="https://www.archlinux.org"
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
sha256sums=('d3f6c7465198415df7bc3b365595642c7255dd69f2d7db548eb071123f43164c'
            '005736b9bd650ff5e5d82a7e288853776d5bb8c90185d5774c07231c1e1c64a9'
            '0f06cbc63a4b95fd3f863561e2ff193f231d749f69ce23c57393234dbca6edfd'
            '005736b9bd650ff5e5d82a7e288853776d5bb8c90185d5774c07231c1e1c64a9'
            '6eb1acdd3fa9f71a7f93fbd529be57ea65bcafc6e3a98a06af4d88013fc6a567'
            'd5ed59ec2157c19c87964a162f7ca84d53c19fb2bd68d3fbc1671ba8d906346f')

package() {
  install -dm755 "$pkgdir/etc/pam.d"
  install -m644 -t "$pkgdir/etc/pam.d" "${source[@]}"
}

# vim:set ts=2 sw=2 et:
