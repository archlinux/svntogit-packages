# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.7.0.1
pkgrel=1
pkgdesc="the fast distributed version control system"
arch=(i686 x86_64)
url="http://git-scm.com/"
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
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    INSTALLDIRS=vendor DESTDIR=${pkgdir} install || return 1
  
  # bash completion
  mkdir -p $pkgdir/etc/bash_completion.d/
  install -m644 ./contrib/completion/git-completion.bash $pkgdir/etc/bash_completion.d/git || return 1

  # more contrib stuff
  cp -a ./contrib $pkgdir/usr/share/git/ || return 1

  # how 'bout some manpages?
  for mansect in man1 man5 man7; do
    for manpage in $srcdir/$mansect/*; do
      install -D -m644 $manpage $pkgdir/usr/share/man/$mansect/$(basename $manpage)
    done
  done

  # remove perllocal.pod, .packlist, and empty directories.
  rm -rf $pkgdir/usr/lib/perl5
}

md5sums=('c4315200efc90ea0f243cf0e86cda1f1'
         '25f70e07db86b247e929a12cfc5bd1c5')
sha256sums=('df36a3dd77d63595e8098dee52e730523ab495b506aeb7b9dfa4964c7803cdc5'
            'e693b7a03dc3868db9a9aaa4d9fa6d56ea876f06e45bc4f4571ee0c9fce0581a')
