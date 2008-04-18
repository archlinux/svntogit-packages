# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-a
pkgver=2.18
_scriptid=7218
_docid=6347
pkgrel=1
pkgdesc="alternate files in vim quickly (.c -> .h etc)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=31"
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid \
        http://www.vim.org/scripts/download_script.php?src_id=$_docid)
md5sums=('6570438244f71e19be1e1b84a5a6c1ec' '0fcef5054b1617fa8217c9bd0bede338')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid a.vim
  mv download_script.php?src_id=$_docid alternate.txt

  mkdir -p $startdir/pkg/usr/share/vim/plugin
  mkdir -p $startdir/pkg/usr/share/vim/doc
  install -m644 a.vim $startdir/pkg/usr/share/vim/plugin/
  install -m644 alternate.txt $startdir/pkg/usr/share/vim/doc/
}
