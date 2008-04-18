#$Id$
#Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-bufexplorer
pkgver=7.1.4
_scriptid=7953
pkgrel=1
pkgdesc="A simple buffer list/switcher for vim "
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=42"
license=('unknown')
depends=('vi>=7.0')
makedepends=('unzip')
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('0aa58e17186f9b4bb28a6be2a97f40e9')

build() {
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid bufexplorer.zip
  unzip -qqo bufexplorer.zip

  mkdir -p $startdir/pkg/usr/share/vim/doc/
  install -m644 doc/bufexplorer.txt $startdir/pkg/usr/share/vim/doc/

  mkdir -p $startdir/pkg/usr/share/vim/plugin/
  install -m644 plugin/bufexplorer.vim $startdir/pkg/usr/share/vim/plugin/
}
