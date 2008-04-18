# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Maintainer: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: David 'SleepyDog' <goodluv@gmail.com>

pkgname=mercurial
pkgver=1.0
pkgrel=2
pkgdesc="A scalable distributed SCM tool"
url="http://www.selenic.com/mercurial"
license="GPL"
depends=('python>=2.5')
source=(http://www.selenic.com/mercurial/release/$pkgname-$pkgver.tar.gz)
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root $startdir/pkg
  install -d $startdir/pkg/usr/share/man/{man1,man5}
  install -m644 doc/{hg.1,hgmerge.1} $startdir/pkg/usr/share/man/man1
  install -m644 doc/{hgrc.5,hgignore.5} $startdir/pkg/usr/share/man/man5
  install -m755 contrib/hgk $startdir/pkg/usr/bin
  install -m644 -D contrib/zsh_completion $startdir/pkg/usr/share/zsh/site-functions/_hg
  install -m644 -D contrib/bash_completion $startdir/pkg/etc/bash_completion.d/hg 
  install -d $startdir/pkg/usr/share/emacs/site-lisp
  install -m644 contrib/{mq.el,mercurial.el} $startdir/pkg/usr/share/emacs/site-lisp
  install -m644 -D contrib/vim/HGAnnotate.vim $startdir/pkg/usr/share/vim/syntax/HGAnnotate.vim

# Autoloading plugins to vim = no good.  
#  install -d $startdir/pkg/usr/share/vim/plugin
#  install -m644 contrib/vim/{hg-menu.vim,hgcommand.vim,patchreview.vim} $startdir/pkg/usr/share/vim/plugin
}

md5sums=('9f8dd7fa6f8886f77be9b923f008504c')
sha1sums=('11689e85a91874417cb110ded6c3a4d7b30429cb')
