# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs
pkgver=26.1
pkgrel=2
pkgdesc="The extensible, customizable, self-documenting real-time display editor"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'libmagick6' 'gnutls')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(ftp://ftp.gnu.org/gnu/emacs/$pkgname-$pkgver.tar.xz{,.sig}
	0001-Ignore-color-fonts-when-using-Xft.patch
	0001-Port-FC_COLOR-change-to-older-fontconfig.patch
	0001-src-ftfont.c-ftfont_spec_pattern-Fix-whitespace.patch)
sha1sums=('53c01d987b2613701f42d9f941c2d5225a5874c4'
          'SKIP'
	  'e6b77aadf6c60dfdc1ec6b61d5968e64d959257d'
	  '6b40ad3d8936bfd068398c8d46cb8e0b9501fe64'
	  '51b3e6a2c32be315c9a15c55ca2e97e84d204f32')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/0001-Ignore-color-fonts-when-using-Xft.patch"
  patch -Np1 -i "${srcdir}/0001-Port-FC_COLOR-change-to-older-fontconfig.patch"
  patch -Np1 -i "${srcdir}/0001-src-ftfont.c-ftfont_spec_pattern-Fix-whitespace.patch"
}

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
