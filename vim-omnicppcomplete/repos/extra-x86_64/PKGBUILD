# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-omnicppcomplete
pkgver=0.4.1 #I know the next version will be 0.5 just to break our crap
_scriptid=7722
pkgrel=1
pkgdesc="vim c++ completion omnifunc with a ctags database"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1520"
license=('unknown')
depends=(vim ctags)
groups=('vim-plugins')
install=vimdoc.install
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('0978a565f95d8980a0035133144db639')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid omnicppcomplete.zip
  unzip -qqo omnicppcomplete.zip

  mkdir -p $startdir/pkg/usr/share/vim/
  cp -r doc after autoload $startdir/pkg/usr/share/vim/

  #just in case... make sure it's all 644
  find $startdir/pkg/usr/share/vim -type f -exec chmod 644 {} \;
}
