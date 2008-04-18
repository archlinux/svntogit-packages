# $Id$
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=drscheme
pkgver=372
pkgrel=1
pkgdesc="PLT Scheme Environment"
url="http://www.drscheme.org/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gcc-libs' 'cairo' 'desktop-file-utils' 'libjpeg' 'mesa' 'openssl<=0.9.8'
        'libxaw' 'libxmu' 'libxft')
options=('!makeflags')
install=$pkgname.install
source=(http://download.plt-scheme.org/bundles/$pkgver/plt/plt-$pkgver-src-unix.tgz
        drscheme.desktop)
md5sums=('751217f63bc64423a29a05423f917af8'
         '41ba9c74aa541308aa6f67b262387c6c')

build() {
  cd $startdir/src/plt-$pkgver/src
  ./configure --prefix=/usr --enable-noopt
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -Dm644 $startdir/src/plt-$pkgver/collects/icons/plt.xpm\
    $startdir/pkg/usr/share/pixmaps/drscheme.xpm
  install -Dm644 $startdir/src/drscheme.desktop\
    $startdir/pkg/usr/share/applications/drscheme.desktop
  chown -R root:root $startdir/pkg/usr/share/plt
}

# vim:set ts=2 sw=2 et:
