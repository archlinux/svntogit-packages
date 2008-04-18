# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-guicolorscheme
pkgver=1.1
_scriptid=7973
pkgrel=1
pkgdesc="auto convert gui-only colorschemes to 88/256 color terminal schemes"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1809"
depends=(vim)
license=('GPL')
groups=('vim-plugins')
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('6c02b3db8fef7a55177d234d2bba5b1d')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid guicolorscheme.vim

  mkdir -p $startdir/pkg/usr/share/vim/plugin
  install -m644 guicolorscheme.vim $startdir/pkg/usr/share/vim/plugin/
}
