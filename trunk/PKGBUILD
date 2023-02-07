# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgbase=e2fsprogs
pkgname=('e2fsprogs' 'fuse2fs')
pkgver=1.47.0
pkgrel=1
pkgdesc='Ext2/3/4 filesystem utilities'
arch=('x86_64')
license=('GPL' 'LGPL' 'MIT')
url='http://e2fsprogs.sourceforge.net'
makedepends=('systemd' 'util-linux' 'fuse')
validpgpkeys=('3AB057B7E78D945C8C5591FBD36F769BC11804F0') # Theodore Ts'o <tytso@mit.edu>
source=("https://www.kernel.org/pub/linux/kernel/people/tytso/${pkgbase}/v${pkgver}/${pkgbase}-${pkgver}.tar."{xz,sign}
        'MIT-LICENSE')
sha256sums=('144af53f2bbd921cef6f8bea88bb9faddca865da3fbc657cc9b4d2001097d5db'
            'SKIP'
            'cc45386c1d71f438ad648fd7971e49e3074ad9dbacf9dd3a5b4cb61fd294ecbb')


prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Remove unnecessary init.d directory
  sed -i '/init\.d/s|^|#|' misc/Makefile.in
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ./configure \
      --prefix=/usr \
      --with-root-prefix='' \
      --libdir=/usr/lib \
      --sbindir=/usr/bin \
      --enable-elf-shlibs \
      --disable-fsck \
      --disable-uuidd \
      --disable-libuuid \
      --disable-libblkid
  make

  # regenerate locale files
  find po/ -name '*.gmo' -delete
  make -C po update-gmo
}

package_e2fsprogs() {
  depends=('sh' 'util-linux-libs')
  optdepends=('lvm2: for e2scrub'
              'util-linux: for e2scrub'
              'smtp-forwarder: for e2scrub_fail script')
  provides=('libcom_err.so'
            'libe2p.so'
            'libext2fs.so'
            'libss.so')
  backup=('etc/mke2fs.conf'
          'etc/e2scrub.conf')

  unset MAKEFLAGS

  cd "${srcdir}/${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install install-libs

  sed -i -e 's/^AWK=.*/AWK=awk/' "${pkgdir}/usr/bin/compile_et"

  # remove references to build directory
  sed -i -e 's#^DIR=.*#DIR="/usr/share/ss"#' "${pkgdir}/usr/bin/mk_cmds"
  sed -i -e 's#^DIR=.*#DIR="/usr/share/et"#' "${pkgdir}/usr/bin/compile_et"

  # remove static libraries with a shared counterpart
  rm "${pkgdir}"/usr/lib/lib{com_err,e2p,ext2fs,ss}.a

  # remove fuse2fs which will be packaged separately
  rm "${pkgdir}"/usr/{bin/fuse2fs,share/man/man1/fuse2fs.1}

  # install MIT license
  install -D -m0644 "${srcdir}/MIT-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE"
}

package_fuse2fs() {
  pkgdesc='Ext2/3/4 filesystem driver for FUSE'
  depends=('fuse' 'e2fsprogs')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -D -m0755 'misc/fuse2fs' "${pkgdir}/usr/bin/fuse2fs"
  install -D -m0644 'misc/fuse2fs.1' "${pkgdir}/usr/share/man/man1/fuse2fs.1"
  mkdir -p "${pkgdir}"/usr/share/licenses
  ln -s "${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
