# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs
pkgver=26.3
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor"
arch=('x86_64')
url="https://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'libmagick6' 'gnutls')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(https://ftp.gnu.org/gnu/emacs/$pkgname-$pkgver.tar.xz{,.sig})
sha1sums=('2960e1dddef401b18abd779cb159306984157eef'
          'SKIP')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
                                    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft \
                                    --with-modules
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
