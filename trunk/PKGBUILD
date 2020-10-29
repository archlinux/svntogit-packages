# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu
pkgver=68.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(x86_64)
url="http://site.icu-project.org/home"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${pkgname}4c-${pkgver//./_}-src.tgz{,.asc})
# https://github.com/unicode-org/icu/releases/download/release-68-1/SHASUM512.txt
sha512sums=('24ff4ce5947c41fc12a168e15d4037556562c7f32c1da0bbedd705232476174a3b2318955a7124426a63c2034eb9ae077e728a5dbada8b9433d7173cac3db307'
            'SKIP')
validpgpkeys=('BA90283A60D67BA0DD910A893932080F4FB419E3') #  "Steven R. Loomis (filfla-signing) <srloomis@us.ibm.com>" 
validpgpkeys+=('9731166CD8E23A83BEE7C6D3ACA5DBE1FD8FABF1') #  "Steven R. Loomis (ICU Project) <srl@icu-project.org>" 
validpgpkeys+=('FFA9129A180D765B7A5BEA1C9B432B27D1BA20D7') # "Fredrik Roubert <fredrik@roubert.name>"
validpgpkeys+=('E4098B78AFC94394F3F49AA903996C7C83F12F11') # "keybase.io/srl295 <srl295@keybase.io>"
validpgpkeys+=('4569BBC09DA846FC91CBD21CE1BBA44593CF2AE0') # "Steven R. Loomis (codesign-qormi) <srloomis@us.ibm.com>"
validpgpkeys+=('0E51E7F06EF719FBD072782A5F56E5AFA63CCD33') #"Craig Cornelius (For use with ICU releases) <ccornelius@google.com>"

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
