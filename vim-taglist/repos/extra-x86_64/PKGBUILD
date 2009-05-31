#$Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-taglist
pkgver=45
_scriptid=7701
pkgrel=1
pkgdesc="A source code browser plugin for vim"
arch=(i686 x86_64)
url="http://vim-taglist.sourceforge.net/"
license=('custom')
depends=(vim ctags)
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid
        license.txt)
md5sums=('99b5366a64eea6092bb140df7d4c1a95' 'efbd5986e691ce8c876fb86e8f5961ea')

build() {
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid taglist_$pkgver.zip
  unzip -qqo taglist_$pkgver.zip

  mkdir -p $startdir/pkg/usr/share/vim/doc/
  install -m644 doc/taglist.txt $startdir/pkg/usr/share/vim/doc/

  mkdir -p $startdir/pkg/usr/share/vim/plugin/
  install -m644 plugin/taglist.vim $startdir/pkg/usr/share/vim/plugin/

  mkdir -p $startdir/pkg/usr/share/licenses/vim-taglist/
  install -m644 $startdir/src/license.txt $startdir/pkg/usr/share/licenses/vim-taglist/
}
