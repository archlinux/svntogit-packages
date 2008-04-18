# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>
# Contributor: Tom K <tomk@runbox.com>
pkgname=gnupod
pkgver=0.99.5
pkgrel=2
pkgdesc="a collection of Perl-Scripts which allow you to use your iPod under GNU/Linux "
arch=(i686 x86_64)
license=("GPL3")
depends=('perl-digest-sha1' 'perl-mp3-info' 'perl-unicode-string' 'perlxml')
source=(http://blinkenlights.ch/$pkgname-dist/stable/$pkgname-$pkgver.tgz)

url="http://www.gnu.org/software/gnupod/"

build() {
  cd $startdir/src/$pkgname-$pkgver

  #Create pkg dirs
  mkdir -p $startdir/pkg/usr/bin $startdir/pkg/usr/man/man1 \
  $startdir/pkg/usr/lib/perl5/current/$CARCH-linux-thread-multi/GNUpod

  #Ignore brain-dead install script, and do the Arch thing
  install -m 755 src/*.pl $startdir/pkg/usr/bin
  install -m 644 man/* $startdir/pkg/usr/man/man1
  install -m 444 src/ext/* $startdir/pkg/usr/lib/perl5/current/$CARCH-linux-thread-multi/GNUpod

  #Tidy up after ignoring brain-dead install script :P
  cd /$startdir/pkg/usr/bin
  for i in `ls` ;
  do sed -i "s:##__PERLBIN__###:\!/usr/bin/perl:;s:###__VERSION__###:$pkgver:" $i ;
  done
}

md5sums=('27dba10439d82ec70d7364cd91dd1491')
