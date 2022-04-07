# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgbase=emacs
pkgname=(emacs emacs-nativecomp)
pkgver=28.1
pkgrel=2
arch=('x86_64')
url='https://www.gnu.org/software/emacs/emacs.html'
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3'
          'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'gnutls'
          'jansson' 'cairo' 'harfbuzz'
)
makedepends=(libgccjit)
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B')
options=(debug)
source=(https://ftp.gnu.org/gnu/emacs/${pkgname}-${pkgver}.tar.xz{,.sig})
b2sums=('42a12bec2dc74f4838ae79b5589fb7439ff415d8ddd34f2ff7a8c503f909ddd4144ad35ae19c758d8627cfa9ed29276b326c5bec3853a77cd179e9fb17d22ad7'
        'SKIP')

prepare() {
  cp -ar ${pkgname}-${pkgver} ${pkgbase}-${pkgver}-nativecomp
}

build() {
  local _confflags="--sysconfdir=/etc \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-cairo \
    --with-harfbuzz \
    --with-modules \
    --with-wide-int \
    --with-x-toolkit=gtk3 \
    --with-xft"

  export ac_cv_lib_gif_EGifPutExtensionLast=yes

  cd ${pkgname}-${pkgver}
  ./configure $_confflags
  make

  cd ../${pkgbase}-${pkgver}-nativecomp
  ./configure \
    --with-native-compilation \
    --without-compress-install \
    $_confflags
  make NATIVE_FULL_AOT=1
}

package_emacs() {
  pkgdesc='The extensible, customizable, self-documenting real-time display editor'

  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "${pkgdir}"/usr/share/emacs/${pkgver} -exec chown root:root {} \;
}

package_emacs-nativecomp() {
  pkgdesc='The extensible, customizable, self-documenting real-time display editor with native compilation enabled'
  depends=(libgccjit)
  provides=(emacs)
  conflicts=(emacs)

  cd ${pkgbase}-${pkgver}-nativecomp
  make DESTDIR="${pkgdir}" install

  # remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "${pkgdir}"/usr/share/emacs/${pkgver} -exec chown root:root {} \;
}
