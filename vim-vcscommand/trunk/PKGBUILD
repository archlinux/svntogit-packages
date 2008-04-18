#$Id$
#Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-vcscommand
#Real version BetaXX
pkgver=19
_scriptid=6814
pkgrel=1
pkgdesc="vim cvs/svn integration plugin "
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=90"
depends=(vi)
groups=('vim-plugins')
replaces=('vim-vsccommand') #whoops, typo before
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('7ed54ebfd83c443cd303256e31278d70')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid vcscommand.zip
  unzip -qqo vcscommand.zip
  cd vcscommand

  mkdir -p $startdir/pkg/usr/share/vim/
  cp -r doc plugin syntax $startdir/pkg/usr/share/vim

  #just in case....
  find $startdir/pkg/usr/share/vim -type f -exec chmod 644 {} \;
}
