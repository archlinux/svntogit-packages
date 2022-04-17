# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils
pkgver=9.1
pkgrel=1
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/coreutils/'
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname-$pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program=groups,hostname,kill,uptime
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
