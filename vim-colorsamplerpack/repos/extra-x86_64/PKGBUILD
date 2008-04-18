# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=vim-colorsamplerpack
pkgver=5.0
pkgrel=1
_scriptid=4010
pkgdesc="140 different colorschemes (all as of March 13,2005) for vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=625"
depends=(vi)
groups=('vim-plugins')
source=(http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('9d14bd2fc239e96d1d837e5d77cbf676')

build()
{
  cd $startdir/src
  mv download_script.php?src_id=$_scriptid ColorSamplerPack.zip
  unzip -qqo ColorSamplerPack.zip
  # These already exist... we can't update them 8(
  cd colors
  rm blue.vim delek.vim desert.vim torte.vim
  cd ..

  mkdir -p $startdir/pkg/usr/share/vim/colors/
  install -m644 colors/* $startdir/pkg/usr/share/vim/colors

  mkdir -p $startdir/pkg/usr/share/vim/plugin/
  install -m644 plugin/themes.vim $startdir/pkg/usr/share/vim/plugin
}
