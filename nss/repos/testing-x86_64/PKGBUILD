# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=nss
pkgname=(nss ca-certificates-mozilla)
pkgver=3.60
pkgrel=1
pkgdesc="Network Security Services"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64)
license=(MPL GPL)
depends=(nspr sqlite zlib sh 'p11-kit>=0.23.19')
makedepends=(perl python gyp)
source=("https://ftp.mozilla.org/pub/security/nss/releases/NSS_${pkgver//./_}_RTM/src/nss-${pkgver}.tar.gz"
        certdata2pem.py bundle.sh)
sha256sums=('84abd5575ab874c53ae511bd461e5d0868d1a1b384ee40753154cdd1d590fe3d'
            'd2a1579dae05fd16175fac27ef08b54731ecefdf414085c610179afcf62b096c'
            '3bfadf722da6773bdabdd25bdf78158648043d1b7e57615574f189a88ca865dd')

prepare() {
  cd nss-$pkgver/nss

  mkdir "$srcdir/certs"
  ln -srt "$srcdir/certs" lib/ckfw/builtins/{certdata.txt,nssckbi.h}
}

build() {
  cd certs
  ../certdata2pem.py

  cd ..
  ./bundle.sh

  cd nss-$pkgver/nss
  ./build.sh \
    --target x64 \
    --opt \
    --system-sqlite \
    --system-nspr \
    --enable-libpkix \
    --disable-tests
}

package_nss() {
  cd nss-$pkgver

  local libdir=/usr/lib nsprver="$(pkg-config --modversion nspr)"
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
  install -Dt "$pkgdir$libdir" -m644 dist/Release/lib/*.chk

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
