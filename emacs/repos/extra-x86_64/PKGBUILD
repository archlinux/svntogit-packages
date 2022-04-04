# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs
pkgver=28.1
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor"
arch=('x86_64')
url="https://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'gnutls' 'jansson' 'cairo' 'harfbuzz')
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B')
source=(https://ftp.gnu.org/gnu/emacs/$pkgname-$pkgver.tar.xz{,.sig})
sha1sums=('a198d69dfa5a42c30cabe9a82edb101ac5ee423c' 'SKIP')


prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
                                    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft --with-wide-int \
                                    --with-modules --with-cairo --with-harfbuzz
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
}
