# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg
pkgver=2.2.38
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org/'
license=(BSD custom custom:CC0 GPL2 GPL3 LGPL3 LGPL2.1 MIT)
arch=('x86_64')
checkdepends=('openssh')
makedepends=('libldap' 'libusb-compat' 'pcsclite')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan' 'pinentry'
         'bzip2' 'libbz2.so' 'readline' 'libreadline.so' 'gnutls' 'sqlite'
         'zlib' 'glibc')
optdepends=(
  'libldap: gpg2keys_ldap'
  'libusb-compat: scdaemon'
  'pcsclite: scdaemon'
)
options=('debug')
validpgpkeys=(
  '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28' # Andre Heinecke (Release Signing Key)
  '6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
  'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD' # Niibe Yutaka (GnuPG Release Key)
  '02F38DFF731FF97CB039A1DA549E695E905BA208' # GnuPG.com (Release Signing Key 2021)
)
source=(
  "https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig}
  'drop-import-clean.patch'
  'avoid-beta-warning.patch'
)
sha256sums=('f02bd9853ea25d7bc3051a5725fb8b455f2481cffb498c707b78cf4380fe97ea'
            'SKIP'
            '02d375f0045f56f7dd82bacdb5ce559afd52ded8b75f6b2673c39ec666e81abc'
            '22fdf9490fad477f225e731c417867d9e7571ac654944e8be63a1fbaccd5c62d')
b2sums=('249fd6502a1607d1881fd97e4a97a1a3557da26929b67424bafcf29b5ef1588c9295347c5be497a8485dd61755bfe40b4f0232e0f1f67d2517c69613c6080da1'
        'SKIP'
        'd598015e7f27b27840667d1656c083b4ad85d6acdd312e9929854067313a5f28415ee7eecf4d84a4b8da0385b667aaa01a9743461f5c785402a56c238274e376'
        '7ea069e81e2d91a3154bcb62516b4b599f34596de277f95ad1ccaba73869c4f84f94f063b65026ba0bc8a72c0fd8e8e182b82346964f67ea78166b6399c923c5')

install=$pkgname.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # improve reproducibility
  rm doc/gnupg.info*

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/gnupg \
    --enable-maintainer-mode \

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  local units=({dirmngr,gpg-agent{,-{browser,extra,ssh}}}.socket)
  local socket_target_dir="$pkgdir/usr/lib/systemd/user/sockets.target.wants/"
  local unit

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  ln -s gpg "${pkgdir}"/usr/bin/gpg2
  ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

  install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm 644 COPYING.{CC0,other} -t "${pkgdir}/usr/share/licenses/$pkgname/"

  install -vdm 755 "$socket_target_dir"
  for unit in "${units[@]}"; do
    ln -sv "../$unit" "$socket_target_dir$unit"
  done
}

# vim: ts=2 sw=2 et:
