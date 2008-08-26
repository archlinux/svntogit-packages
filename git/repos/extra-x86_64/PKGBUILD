# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.6.0.1
pkgrel=1
pkgdesc="GIT - the stupid content tracker"
arch=(i686 x86_64)
url="http://git.or.cz/"
license=('GPL2')
depends=('curl' 'expat>=2.0' 'perl-error' 'perl>=5.10.0')
replaces=('git-core')
provides=('git-core')
install=git.install
source=("http://kernel.org/pub/software/scm/git/${pkgname}-${pkgver}.tar.bz2" \
        "http://kernel.org/pub/software/scm/git/git-manpages-${pkgver}.tar.bz2")

build() {
  cd $srcdir/$pkgname-$pkgver
  make THREADED_DELTA_SEARCH=1 \
    prefix=/usr gitexecdir=/usr/lib/git-core || return 1
  make THREADED_DELTA_SEARCH=1 \
    prefix=/usr gitexecdir=/usr/lib/git-core \
	INSTALLDIRS=vendor DESTDIR=${pkgdir} install
  
  # let's plop gitweb in /usr/share
  mkdir -p $pkgdir/usr/share/ || return 1
  cp -dR ./gitweb $pkgdir/usr/share/gitweb || return 1

  #bash completion
  mkdir -p $pkgdir/etc/bash_completion.d/ || return 1
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

md5sums=('264701ebd9036ca2458358f01aa6c093'
         '07b357210b59a1140200815c682fda34')
