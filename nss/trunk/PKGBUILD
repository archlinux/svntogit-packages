# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=nss
pkgname=(nss ca-certificates-mozilla)
pkgver=3.87
pkgrel=1
pkgdesc="Network Security Services"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64)
license=(MPL GPL)
depends=('nspr>=4.35' sqlite zlib sh 'p11-kit>=0.23.19')
makedepends=(perl python gyp mercurial)
_revision=41b6d2645ead825e78816487b58c4fff54d1193c
source=("hg+https://hg.mozilla.org/projects/nss#revision=$_revision"
        certdata2pem.py bundle.sh)
sha256sums=('SKIP'
            'd2a1579dae05fd16175fac27ef08b54731ecefdf414085c610179afcf62b096c'
            '3bfadf722da6773bdabdd25bdf78158648043d1b7e57615574f189a88ca865dd')

pkgver() {
  cd nss
  hg id -t -r. | sed 's/^NSS_//;s/_RTM$//;s/_/./g'
}

prepare() {
  mkdir -p certs
  ln -srft certs nss/lib/ckfw/builtins/{certdata.txt,nssckbi.h}
}

build() {
  cd certs
  ../certdata2pem.py

  cd ..
  ./bundle.sh

  cd nss
  ./build.sh \
    --target x64 \
    --opt \
    --system-sqlite \
    --system-nspr \
    --enable-libpkix \
    --disable-tests
}

package_nss() {
  local nsprver="$(pkg-config --modversion nspr)"
  local libdir=/usr/lib

  sed nss/pkg/pkg-config/nss.pc.in \
    -e "s,%libdir%,$libdir,g" \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,/usr/bin,g" \
    -e "s,%includedir%,/usr/include/nss,g" \
    -e "s,%NSPR_VERSION%,$nsprver,g" \
    -e "s,%NSS_VERSION%,$pkgver,g" |
    install -Dm644 /dev/stdin "$pkgdir$libdir/pkgconfig/nss.pc"

  ln -s nss.pc "$pkgdir$libdir/pkgconfig/mozilla-nss.pc"

  install -Dt "$pkgdir$libdir" dist/Release/lib/*.so

  local vmajor vminor vpatch
  { read vmajor; read vminor; read vpatch; } \
    < <(awk '/#define.*NSS_V(MAJOR|MINOR|PATCH)/ {print $3}' nss/lib/nss/nss.h)

  sed nss/pkg/pkg-config/nss-config.in \
    -e "s,@libdir@,$libdir,g" \
    -e "s,@prefix@,/usr/bin,g" \
    -e "s,@exec_prefix@,/usr/bin,g" \
    -e "s,@includedir@,/usr/include/nss,g" \
    -e "s,@MOD_MAJOR_VERSION@,$vmajor,g" \
    -e "s,@MOD_MINOR_VERSION@,$vminor,g" \
    -e "s,@MOD_PATCH_VERSION@,$vpatch,g" |
    install -D /dev/stdin "$pkgdir/usr/bin/nss-config"

  install -Dt "$pkgdir/usr/bin" \
    dist/Release/bin/{*util,shlibsign,signtool,signver,ssltap}

  install -Dt "$pkgdir/usr/include/nss" -m644 dist/public/nss/*.h

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

# vim:set sw=2 et:
