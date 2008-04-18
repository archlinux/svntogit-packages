# $Id$
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=bash-completion
pkgver=20060301
pkgrel=9
pkgdesc="Programmable completion indefinitely extends the type of completion built in bash"
arch=(i686 x86_64)
url='http://www.caliban.org/bash/'
license=('GPL')
depends=('bash')
source=(http://www.caliban.org/files/bash/$pkgname-$pkgver.tar.gz
        bash_completion.sh completion_updates.patch)
md5sums=('9bca1cf97e8f8c73e3ef560cc9dead21'
         'f7386d73b862ae1dd04afb4f1fa1dd3a'
         'e1b6eabe924da0b211b11ef63a373725')

build()
{
  cd $startdir/src/bash_completion
  patch -Np0 -i ../completion_updates.patch
  install -D -m755 bash_completion $startdir/pkg/etc/bash_completion
  install -D -m755 ../bash_completion.sh $startdir/pkg/etc/profile.d/bash_completion.sh

  mkdir -p $startdir/pkg/etc/bash_completion.d
  install -m644 contrib/* $startdir/pkg/etc/bash_completion.d

  # Mercurial provides it's updated completion for itself
  rm $startdir/pkg/etc/bash_completion.d/hg

}

