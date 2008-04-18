# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-buftabs
pkgver=0.9
_scriptid=7544
pkgrel=1
pkgdesc="Minimalistic buffer tabs saving screen space "
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1664"
license=('unknown')
depends=(vim)
groups=('vim-plugins')
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('ff701417cf2c67ed8f2fa161b029662b')

build() {
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid buftabs.vim

  mkdir -p $startdir/pkg/usr/share/vim/plugin/
  install -m644 buftabs.vim $startdir/pkg/usr/share/vim/plugin/
}
