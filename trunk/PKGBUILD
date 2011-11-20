# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.7.7.4
pkgrel=1
pkgdesc="the fast distributed version control system"
arch=(i686 x86_64)
url="http://git-scm.com/"
license=('GPL2')
depends=('curl' 'expat>=2.0' 'perl-error' 'perl>=5.14.0' 'openssl' 'pcre')
makedepends=('python2' 'emacs')
optdepends=('tk: gitk and git gui'
            'perl-libwww: git svn'
            'perl-term-readkey: git svn'
            'perl-mime-tools: git send-email'
            'perl-net-smtp-ssl: git send-email TLS support'
            'perl-authen-sasl: git send-email TLS support'
            'python2: various helper scripts'
            'subversion: git svn'
            'cvsps: git cvsimport')
replaces=('git-core')
provides=('git-core')
backup=('etc/conf.d/git-daemon.conf')
#source=("http://kernel.org/pub/software/scm/git/${pkgname}-${pkgver}.tar.bz2"
#        "http://kernel.org/pub/software/scm/git/git-manpages-$pkgver.tar.bz2"
source=("http://git-core.googlecode.com/files/git-$pkgver.tar.gz"
        "http://git-core.googlecode.com/files/git-manpages-$pkgver.tar.gz"
        git-daemon
        git-daemon.conf)
changelog=ChangeLog

build() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1

  cd contrib/emacs
  make prefix=/usr
}

package() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    INSTALLDIRS=vendor DESTDIR="$pkgdir" install 

  # bash completion
  mkdir -p "$pkgdir"/etc/bash_completion.d/
  install -m644 ./contrib/completion/git-completion.bash "$pkgdir"/etc/bash_completion.d/git 
  # more contrib stuff
  cp -a ./contrib $pkgdir/usr/share/git/ 
  # scripts are for python 2.x
  sed -i 's|#![ ]*/usr/bin/env python|#!/usr/bin/env python2|' \
    $(find "$pkgdir" -name '*.py') \
    "$pkgdir"/usr/share/git/{fast-import/git-p4,gitview/gitview}

  # emacs interface
  cd contrib/emacs
  make prefix=/usr DESTDIR="$pkgdir" install

  # how 'bout some manpages?
  for mansect in man1 man5 man7; do
    for manpage in "$srcdir"/$mansect/*; do
      install -D -m644 $manpage "$pkgdir"/usr/share/man/$mansect/$(basename $manpage)
    done
  done

  # remove perllocal.pod, .packlist, and empty directories.
  rm -rf "$pkgdir"/usr/lib/perl5

  # git daemon script
  install -D -m755 "$srcdir"/git-daemon "$pkgdir"/etc/rc.d/git-daemon
  install -D -m644 "$srcdir"/git-daemon.conf "$pkgdir"/etc/conf.d/git-daemon.conf
}

sha1sums=('5b6920989480a37ec65977e756b24961578795dd'
          'cb21e55ae793865453c165a0e666348f2db8c740'
          'f2b41828bd912b72e2cb3e14677739c4f370de66'
          '149e2da1ecb48872ddb31c0945afeaad1f9653d7')
