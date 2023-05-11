# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu
pkgver=73.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(x86_64)
url="https://icu.unicode.org"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${pkgname}4c-${pkgver//./_}-src.tgz{,.asc}
        ICU-22356.patch)
# https://github.com/unicode-org/icu/releases/download/release-73-1/SHASUM512.txt
sha512sums=('e788e372716eecebc39b56bbc88f3a458e21c3ef20631c2a3d7ef05794a678fe8dad482a03a40fdb9717109a613978c7146682e98ee16fade5668d641d5c48f8'
            'SKIP'
            '313d4df98283be228eb9f5fb664c545d4dc497a7ee433a2929f04703b28bc985a510f0b26f1e60ec8aa1cb36cb7dea493b3c26fc4ab34b0acafeaad3a62d52c6')
#validpgpkeys=('BA90283A60D67BA0DD910A893932080F4FB419E3') #  "Steven R. Loomis (filfla-signing) <srloomis@us.ibm.com>" 
#validpgpkeys+=('9731166CD8E23A83BEE7C6D3ACA5DBE1FD8FABF1') #  "Steven R. Loomis (ICU Project) <srl@icu-project.org>" 
validpgpkeys+=('FFA9129A180D765B7A5BEA1C9B432B27D1BA20D7') # "Fredrik Roubert <fredrik@roubert.name>"
#validpgpkeys+=('E4098B78AFC94394F3F49AA903996C7C83F12F11') # "keybase.io/srl295 <srl295@keybase.io>"
#validpgpkeys+=('4569BBC09DA846FC91CBD21CE1BBA44593CF2AE0') # "Steven R. Loomis (codesign-qormi) <srloomis@us.ibm.com>"
#validpgpkeys=('0E51E7F06EF719FBD072782A5F56E5AFA63CCD33') #"Craig Cornelius (For use with ICU releases) <ccornelius@google.com>"
#validpgpkeys=('3DA35301A7C330257B8755754058F67406EAA6AB') # Craig Cornelius <ccornelius@google.com>

prepare() {
  cd icu/source
  # https://unicode-org.atlassian.net/browse/ICU-22356
  patch -Np3 -i ../../ICU-22356.patch
}

build() {
  cd icu/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

check() {
  cd icu/source
  make -k check
}

package() {
  cd icu/source
  make -j1 DESTDIR="${pkgdir}" install

  # Install license
  install -Dm644 "${srcdir}"/icu/LICENSE "${pkgdir}"/usr/share/licenses/icu/LICENSE
}
