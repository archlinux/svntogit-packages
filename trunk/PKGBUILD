# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=pambase
pkgver=20171006
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
            '75b3bc548ff8b037d28bda9413d2e18ddda17c96a7956f00d259b9d29b87a5b3'
            '005736b9bd650ff5e5d82a7e288853776d5bb8c90185d5774c07231c1e1c64a9'
            '6eb1acdd3fa9f71a7f93fbd529be57ea65bcafc6e3a98a06af4d88013fc6a567'
            'de66118684a2ecec18017dd96e50a489f30465510250c007ced16f81fb542ba5')

package() {
  install -dm755 "$pkgdir/etc/pam.d"
  install -m644 -t "$pkgdir/etc/pam.d" "${source[@]}"
}

# vim:set ts=2 sw=2 et:
