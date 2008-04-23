#$Id$
#Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-bufexplorer
pkgver=7.1.7
_scriptid=8079
pkgrel=1
pkgdesc="A simple buffer list/switcher for vim "
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=42"
license=('custom')
depends=('vi>=7.0')
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid
        license.txt)
md5sums=('dc8e1b14f20c0e5a00d67705870a896f'
         'b1a7f22e90469abdad3ffd55120e6887')

build() {
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid bufexplorer.zip
  bsdtar -xf bufexplorer.zip

  install -D -m644 doc/bufexplorer.txt \
      $startdir/pkg/usr/share/vim/doc/bufexplorer.txt

  install -D -m644 plugin/bufexplorer.vim \
      $startdir/pkg/usr/share/vim/plugin/bufexplorer.vim

  install -D -m644 license.txt \
      $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}
