# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-project
pkgver=1.4.1
_scriptid=6273
pkgrel=1
pkgdesc="organize and navigate projects of files (like an ide/buffer explorer)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=69"
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('95ddb23f0e301a79e869c608a36637de')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid project-${pkgver}.tar.gz
  tar xzf project-${pkgver}.tar.gz

  mkdir -p $startdir/pkg/usr/share/vim/doc
  install -m644 doc/project.txt $startdir/pkg/usr/share/vim/doc

  mkdir -p $startdir/pkg/usr/share/vim/plugin
  install -m644 plugin/project.vim $startdir/pkg/usr/share/vim/plugin
}
