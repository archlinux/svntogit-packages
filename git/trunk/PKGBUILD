# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.6.1.1
pkgrel=1
pkgdesc="GIT - the stupid content tracker"
arch=(i686 x86_64)
url="http://git.or.cz/"
license=('GPL2')
depends=('curl' 'expat>=2.0' 'perl-error' 'perl>=5.10.0')
optdepends=('tk: gitk and git gui'
            'perl-libwww: git svn'
            'perl-term-readkey: git svn'
            'subversion: git svn'
            'cvsps: git cvsimport')
replaces=('git-core')
provides=('git-core')
source=("http://kernel.org/pub/software/scm/git/${pkgname}-${pkgver}.tar.bz2" \
        "http://kernel.org/pub/software/scm/git/git-manpages-${pkgver}.tar.bz2")

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr gitexecdir=/usr/lib/git-core || return 1
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    INSTALLDIRS=vendor DESTDIR=${pkgdir} install || return 1
  
  # let's plop gitweb in /usr/share
  mkdir -p $pkgdir/usr/share/
  cp -dR ./gitweb $pkgdir/usr/share/gitweb || return 1

  #bash completion
  mkdir -p $pkgdir/etc/bash_completion.d/
  install -m644 ./contrib/completion/git-completion.bash $pkgdir/etc/bash_completion.d/git || return 1

  # how 'bout some manpages?
  for mansect in man1 man5 man7; do
    for manpage in $srcdir/$mansect/*; do
      install -D -m644 $manpage $pkgdir/usr/share/man/$mansect/$(basename $manpage)
    done
  done

  # remove perllocal.pod, .packlist, and empty directories.
  rm -rf $pkgdir/usr/lib/perl5
}

md5sums=('d2b6925cb03e1e33911fdf9392946747'
         '2a985d0856d878030b53d0bbe359ab08')
sha256sums=('ebc170c0e932ff74d8f99d705f88babe0e2691bb262a2f7ad3d91f116b9eb3e2'
            '004fda1ac720d6f0a5c93370f5b5a69f91c26929cf95fe9d760c79be5e369cfc')
