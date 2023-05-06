# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=nss
pkgname=(nss ca-certificates-mozilla)
pkgver=3.89.1
pkgrel=1
pkgdesc="Network Security Services"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64)
license=(
  GPL
  MPL
)
depends=(
  'nspr>=4.35'
  'p11-kit>=0.23.19'
  sh
  sqlite
  zlib
)
makedepends=(
  gyp
  mercurial
  perl
  python
)
_revision=c8e02a52aa1979e28bdba814df1b72fc743d66d4
source=(
  "hg+https://hg.mozilla.org/projects/nss#revision=$_revision"
  bundle.sh
  certdata2pem.py
)
b2sums=('SKIP'
        '4be5dd836c844fdd7b63302a6994d62149082c3bc81eef70f373f416fed80a61a923960e4390d1c391b81ab01b409370d788818a30ffdd3a4ed467b670f990f6'
        '6bb59dcc9289916dcbf8fb6d73db0c0cd7582dc12a3aa4e8be19ec62c9ede65fdd9470a2d92ec5a114506b78d2d21b8ae0a1b45a17dc1f90f7d75434a93da510')

pkgver() {
  cd nss
  hg id -t -r. | sed 's/^NSS_//;s/_RTM$//;s/_/./g'
}

prepare() {
  mkdir -p certs
  ln -srft certs nss/lib/ckfw/builtins/{certdata.txt,nssckbi.h}
}

build() {
  local buildsh_options=(
    --disable-tests
    --enable-libpkix
    --opt
    --system-nspr
    --system-sqlite
    --target x64
  )

  cd certs
  ../certdata2pem.py

  cd ..
  ./bundle.sh

  cd nss
  ./build.sh "${buildsh_options[@]}"
}

package_nss() {
  local nsprver="$(pkg-config --modversion nspr)"
  local libdir=/usr/lib includedir=/usr/include/nss

  sed nss/pkg/pkg-config/nss.pc.in \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,\${prefix},g" \
    -e "s,%libdir%,$libdir,g" \
    -e "s,%includedir%,$includedir,g" \
    -e "s,%NSPR_VERSION%,$nsprver,g" \
    -e "s,%NSS_VERSION%,$pkgver,g" |
    install -Dm644 /dev/stdin "$pkgdir$libdir/pkgconfig/nss.pc"

  ln -s nss.pc "$pkgdir$libdir/pkgconfig/mozilla-nss.pc"

  install -Dt "$pkgdir$libdir" dist/Release/lib/*.so

  local vmajor vminor vpatch
  { read vmajor; read vminor; read vpatch; } \
    < <(awk '/#define.*NSS_V(MAJOR|MINOR|PATCH)/ {print $3}' nss/lib/nss/nss.h)

  sed nss/pkg/pkg-config/nss-config.in \
    -e "s,@prefix@,/usr,g" \
    -e "s,@exec_prefix@,/usr,g" \
    -e "s,@libdir@,$libdir,g" \
    -e "s,@includedir@,$includedir,g" \
    -e "s,@MOD_MAJOR_VERSION@,$vmajor,g" \
    -e "s,@MOD_MINOR_VERSION@,$vminor,g" \
    -e "s,@MOD_PATCH_VERSION@,$vpatch,g" |
    install -D /dev/stdin "$pkgdir/usr/bin/nss-config"

  install -Dt "$pkgdir/usr/bin" \
    dist/Release/bin/{*util,shlibsign,signtool,signver,ssltap}

  install -Dt "$pkgdir$includedir" -m644 dist/public/nss/*.h

  install -Dt "$pkgdir/usr/share/man/man1" -m644 \
    nss/doc/nroff/{*util,signtool,signver,ssltap}.1

  # Replace built-in trust with p11-kit connection
  ln -s pkcs11/p11-kit-trust.so "$pkgdir$libdir/p11-kit-trust.so"
  ln -sf p11-kit-trust.so "$pkgdir$libdir/libnssckbi.so"
}

package_ca-certificates-mozilla() {
  pkgdesc="Mozilla's set of trusted CA certificates"
  depends=('ca-certificates-utils>=20181109-3')

  install -Dm644 ca-bundle.trust.p11-kit \
    "$pkgdir/usr/share/ca-certificates/trust-source/mozilla.trust.p11-kit"
}

# vim:set sw=2 sts=-1 et:
