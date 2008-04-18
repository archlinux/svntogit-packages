# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-workspace
pkgver=1.0b1
_scriptid=4812
pkgrel=1
pkgdesc="vim workspace manager plugin for managing groups of files "
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1410"
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('bd6828d19ce7c62aac0afe28b881a8ba')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid workspace_1b1.zip
  unzip -qqo workspace_1b1.zip

  mkdir -p $startdir/pkg/usr/share/vim/doc
  install -m644 doc/workspace.txt $startdir/pkg/usr/share/vim/doc

  mkdir -p $startdir/pkg/usr/share/vim/plugin
  install -m644 plugin/workspace.vim $startdir/pkg/usr/share/vim/plugin
}
