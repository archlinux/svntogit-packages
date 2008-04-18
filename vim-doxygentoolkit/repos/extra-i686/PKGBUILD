# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-doxygentoolkit
pkgver=0.1.17
_scriptid=6978
pkgrel=1
pkgdesc="simplify doxygen documentation in C/C++."
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=987"
depends=(vim)
groups=('vim-plugins')
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('278c4c05a35d913973d849d63f1587a9')

build() {
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid DoxygenToolkit.vim

  mkdir -p $startdir/pkg/usr/share/vim/plugin
  install -m644 DoxygenToolkit.vim $startdir/pkg/usr/share/vim/plugin/
}
