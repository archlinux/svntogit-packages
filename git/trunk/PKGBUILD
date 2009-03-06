# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.6.2
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

md5sums=('12c7d874e17c6e111697b1714b5f4319'
         '163809f883e693a3a675a487d96b5a11')
sha256sums=('ab7dc40240092aa2e72a8db7e0045893ca5fa07a936e9fa83b242248e3c9f635'
            '13e7d352f9cac1f34d64b5deb006d0961941e43975a33f7d8507df58df1fe68e')
