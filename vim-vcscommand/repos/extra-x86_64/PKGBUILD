#$Id$
#Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-vcscommand
#Real version BetaXX
pkgver=22
_scriptid=8459
pkgrel=1
pkgdesc="vim cvs/svn integration plugin "
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=90"
license=("custom")
depends=(vi)
groups=('vim-plugins')
replaces=('vim-vsccommand') #whoops, typo before
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid
        license.txt)
md5sums=('dbda5624b24bdfc55d2bb6b7fcdaaa91'
         'cc76e422214169f380e6a1548f617778')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid vcscommand.zip
  bsdtar -xf vcscommand.zip

  mkdir -p $startdir/pkg/usr/share/vim/
  cp -r doc plugin syntax $startdir/pkg/usr/share/vim

  #just in case....
  find $startdir/pkg/usr/share/vim -type f -exec chmod 644 {} \;

  install -D -m644 license.txt \
    $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}
