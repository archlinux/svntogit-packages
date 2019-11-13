# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=ca-certificates
pkgname=(ca-certificates-utils ca-certificates)
pkgver=20181109
pkgrel=2
pkgdesc="Common CA certificates"
url="https://src.fedoraproject.org/rpms/ca-certificates"
arch=(any)
license=(GPL2)
makedepends=(asciidoc p11-kit)
source=(update-ca-trust update-ca-trust.8.txt update-ca-trust.hook)
sha256sums=('ba98e00f80f94e2648b66252119d1b0da2339b8c83860cd69738e5c4e2d0fcc3'
            'acf571f7d7a9df2149a373017280e8f22d07a2d36600256fa48159d22ab74751'
            '15eb04e757b7c61c8ee1540fd697771b8ae8e31f92cfb39c260b423101e21af8')

build() {
  asciidoc.py -v -d manpage -b docbook update-ca-trust.8.txt
  xsltproc --nonet -o update-ca-trust.8 /etc/asciidoc/docbook-xsl/manpage.xsl update-ca-trust.8.xml
}

package_ca-certificates-utils() {
  pkgdesc+=" (utilities)"
  depends=('bash' 'coreutils' 'findutils' 'p11-kit>=0.23.1')
  provides=(ca-certificates ca-certificates-java)
  conflicts=(ca-certificates-java)
  replaces=(ca-certificates-java)

  install -D update-ca-trust "$pkgdir/usr/bin/update-ca-trust"
  install -Dm644 update-ca-trust.8 "$pkgdir/usr/share/man/man8/update-ca-trust.8"
  install -Dm644 update-ca-trust.hook "$pkgdir/usr/share/libalpm/hooks/update-ca-trust.hook"

  # Trust source directories
  install -d "$pkgdir"/{etc,usr/share}/$pkgbase/trust-source/{anchors,blacklist}

  # Directories used by update-ca-trust (aka "trust extract-compat")
  install -d "$pkgdir"/etc/{ssl/certs/{edk2,java},$pkgbase/extracted}

  # Compatibility link for OpenSSL using /etc/ssl as CAdir
  # Used in preference to the individual links in /etc/ssl/certs
  ln -sr "$pkgdir/etc/$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/cert.pem"

  # Compatiblity link for legacy bundle
  ln -sr "$pkgdir/etc/$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/certs/ca-certificates.crt"
}

package_ca-certificates() {
  pkgdesc+=" (default providers)"
  depends=(ca-certificates-mozilla)
  replaces=('ca-certificates-cacert<=20140824-4')
  conflicts=('ca-certificates-cacert<=20140824-4')
}

# vim:set et sw=2:
