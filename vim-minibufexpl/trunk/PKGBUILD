# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-minibufexpl
pkgver=6.3.2
pkgrel=3
_scriptid=3640
pkgdesc="An elegant buffer explorer for vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=159"
depends=(vim)
groups=('vim-plugins')
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('c47a9d844788daa38563c4e33c8f0d6e')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid minibufexpl.vim

  mkdir -p $startdir/pkg/usr/share/vim/plugin/
  install -m644 minibufexpl.vim $startdir/pkg/usr/share/vim/plugin/
}
