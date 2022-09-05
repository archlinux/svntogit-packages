# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=ca-certificates
pkgname=(ca-certificates-utils ca-certificates)
pkgver=20220905
pkgrel=1
pkgdesc="Common CA certificates"
url="https://src.fedoraproject.org/rpms/ca-certificates"
arch=(any)
license=(GPL)
makedepends=(asciidoc p11-kit)
source=(update-ca-trust update-ca-trust.8.txt 40-update-ca-trust.hook
        README.{etc,etcssl,extr,java,src,usr})
sha256sums=('ba98e00f80f94e2648b66252119d1b0da2339b8c83860cd69738e5c4e2d0fcc3'
            '7123fcc59bcf50dac66606c8d1b2669106e88579375f98b12e8ae06d96eb7763'
            '3a3833ebd6f9cdef2e534a273653f973a4354d4f9368577d0d73236b014b7748'
            'e14e00e2e862ac0da3fc77c265e58ee3dcc9c776280639323b8ee804c9d0f69a'
            'c94462e3addd6328d3fda77436bfb9d39099dd9dbfb6bafd5941d743cb0aaf10'
            'badc9c0ec9324dae0889b8f5a5c70f14416507234b9cafcb84ecb99a2b67fc78'
            '5300660244bb621cbbb7fd3646bd33f7a5fad6801580593d8d5b3cf6fa9a158d'
            'eba594055ad00cb0b73fc2b0eb8aa4845e5cb4eb42aac88e5f1429213b9e301f'
            '3493832f17595d6d5a6711e5b188ef36f040e0caec7e0f3303623550ed6943cc')

build() {
  a2x -v -f manpage update-ca-trust.8.txt
}

package_ca-certificates-utils() {
  pkgdesc+=" (utilities)"
  depends=(bash coreutils findutils 'p11-kit>=0.24.0')
  provides=(ca-certificates ca-certificates-java)
  conflicts=(ca-certificates-java)
  replaces=(ca-certificates-java)
  install=ca-certificates-utils.install

  install -Dt "$pkgdir/usr/bin" update-ca-trust
  install -Dt "$pkgdir/usr/share/man/man8" -m644 update-ca-trust.8
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook

  # Trust source directories
  install -Dm644 README.etc "$pkgdir/etc/$pkgbase/README"
  install -Dm644 README.src "$pkgdir/etc/$pkgbase/trust-source/README"
  install -Dm644 README.usr "$pkgdir/usr/share/$pkgbase/trust-source/README"
  install -d "$pkgdir"/{etc,usr/share}/$pkgbase/trust-source/{anchors,blocklist}

  # Directories used by update-ca-trust (aka "trust extract-compat")
  install -Dm644 README.etcssl "$pkgdir/etc/ssl/README"
  install -Dm644 README.java   "$pkgdir/etc/ssl/certs/java/README"
  install -Dm644 README.extr   "$pkgdir/etc/$pkgbase/extracted/README"

  # Compatibility link for OpenSSL using /etc/ssl as CAdir
  # Used in preference to the individual links in /etc/ssl/certs
  ln -sr "$pkgdir/etc/$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/cert.pem"

  # Compatibility link for legacy bundle (Debian)
  ln -sr "$pkgdir/etc/$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/certs/ca-certificates.crt"

  # Compatibility link for legacy bundle (RHEL/Fedora)
  ln -sr "$pkgdir/etc/$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/certs/ca-bundle.crt"
}

package_ca-certificates() {
  pkgdesc+=" (default providers)"
  depends=(ca-certificates-mozilla)
  conflicts=('ca-certificates-cacert<=20140824-4')
  replaces=("${conflicts[@]}")
}

# vim:set sw=2 sts=-1 et:
