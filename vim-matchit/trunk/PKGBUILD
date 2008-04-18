# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-matchit
pkgver=1.13.1
_scriptid=7637
pkgrel=1
pkgdesc="Extended % matching for vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=39"
depends=(vim)
groups=('vim-plugins')
license=('custom:none')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('5393ef6701e3d39b732098225daab832')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid matchit.zip
  unzip -qqo matchit.zip

  mkdir -p $startdir/pkg/usr/share/vim/doc/
  install -m644 doc/matchit.txt $startdir/pkg/usr/share/vim/doc/

  mkdir -p $startdir/pkg/usr/share/vim/plugin/
  install -m644 plugin/matchit.vim $startdir/pkg/usr/share/vim/plugin/
}
