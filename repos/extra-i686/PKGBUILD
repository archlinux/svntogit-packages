# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.7.5.1
pkgrel=1
pkgdesc="the fast distributed version control system"
arch=(i686 x86_64)
url="http://git-scm.com/"
license=('GPL2')
depends=('curl' 'expat>=2.0' 'perl-error' 'perl>=5.12.2')
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
source=("http://kernel.org/pub/software/scm/git/${pkgname}-${pkgver}.tar.bz2" \
        "http://kernel.org/pub/software/scm/git/git-manpages-${pkgver}.tar.bz2"
        git-daemon
        git-daemon.conf)
changelog=ChangeLog

build() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"

  cd contrib/emacs
  make prefix=/usr
}

package() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    INSTALLDIRS=vendor DESTDIR="$pkgdir" install 

  # bash completion
  mkdir -p $pkgdir/etc/bash_completion.d/
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

md5sums=('a49291116e3b0564e069ae989e4db6fb'
         'cb0ec1095fbdf5b4935d5c43194b976a'
         '8e2648910fd5dd4f1c41d3c7fa9e9156'
         '2e42bf97779a1c6411d89043334c9e78')
sha256sums=('a1d4a1c59300e68fbc493a2cbe9257048d4d6f4363924bf34f38c413a825f80c'
            '9d8ab1487df85ca596f3f6718d6a7831868abd9b98035a65c71d7f45af4aac8e'
            '2e0a50bdaf8f387a499895e1c204bff78244eaa72b78187c8a84ef40c0b82598'
            'e8bfe29d8393d2b87517c4dd56ea834b213aa00bf3d7fcde4ead3457cadbbc68')
