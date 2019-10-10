# Maintainer: Jürgen Hötzel <juergen@archlinux.org>

pkgbase='ocaml'
pkgname=('ocaml' 'ocaml-compiler-libs')
pkgver=4.09.0
pkgrel=1
pkgdesc="A functional language with OO extensions"
arch=('x86_64')
license=('LGPL2.1' 'custom: QPL-1.0')
url="https://caml.inria.fr/"
makedepends=('ncurses>=5.6-7')
optdepends=('ncurses: advanced ncurses features' 'tk: advanced tk features')
source=(https://caml.inria.fr/distrib/ocaml-${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha512sums=('5cd745802ee53ab85ee676a20fbb28985ba68965df1d7242de5763d982b0a744951da742615fe478c4d3c98b34531632e3a71de89da6c717ccd90cc01e6fff26')
options=('!makeflags' '!emptydirs' 'staticlibs')



build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix /usr --mandir /usr/share/man
  make --debug=v world.opt
}

package_ocaml() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Save >10MB with this one, makepkg only strips debug symbols.
  #find "${pkgdir}/usr/lib" -type f -name '*.so.*' -exec strip --strip-unneeded {} \;

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

  # remove compiler libs
  rm -rf "${pkgdir}/usr/lib/ocaml/compiler-libs"
}

package_ocaml-compiler-libs() {
pkgdesc="Several modules used internally by the OCaml compiler"
license=('custom: QPL-1.0')
depends=('ocaml')
optdepends=()

  cd "${srcdir}/${pkgbase}-${pkgver}"
  # from Makefile
  BYTESTART=driver/main.cmo
  TOPLEVELSTART=toplevel/topstart.cmo
  mkdir -p "${pkgdir}/usr/lib/ocaml/compiler-libs"
  cp utils/*.cmi utils/*.cmt utils/*.cmti utils/*.mli \
     parsing/*.cmi parsing/*.cmt parsing/*.cmti parsing/*.mli \
     typing/*.cmi typing/*.cmt typing/*.cmti typing/*.mli \
     bytecomp/*.cmi bytecomp/*.cmt bytecomp/*.cmti bytecomp/*.mli \
     driver/*.cmi driver/*.cmt driver/*.cmti driver/*.mli \
     toplevel/*.cmi toplevel/*.cmt toplevel/*.cmti toplevel/*.mli \
     "${pkgdir}/usr/lib/ocaml/compiler-libs"
  cp compilerlibs/* ${BYTESTART} ${TOPLEVELSTART} \
  "${pkgdir}/usr/lib/ocaml/compiler-libs"

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
