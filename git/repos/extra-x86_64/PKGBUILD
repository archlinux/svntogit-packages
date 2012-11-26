# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.8.0.1
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
install=git.install
source=("http://git-core.googlecode.com/files/git-$pkgver.tar.gz"
        "http://git-core.googlecode.com/files/git-manpages-$pkgver.tar.gz"
        git-daemon
        git-daemon.conf
        git-daemon@.service
        git-daemon.socket)

build() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    all

  cd contrib/emacs
  make prefix=/usr
}

check() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  local jobs
  jobs=$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*')
  mkdir -p /dev/shm/git-test
  # We used to use this, but silly git regressions:
  #GIT_TEST_OPTS="--root=/dev/shm/" \
  # http://comments.gmane.org/gmane.comp.version-control.git/202020
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    NO_SVN_TESTS=y \
    DEFAULT_TEST_TARGET=prove \
    GIT_PROVE_OPTS="$jobs -Q" \
    GIT_TEST_OPTS="--root=/dev/shm/git-test" \
    test
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
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m644 ./contrib/completion/git-completion.bash "$pkgdir"/usr/share/bash-completion/completions/git 
  # fancy git prompt
  mkdir -p "$pkgdir"/usr/share/git/
  install -m644 ./contrib/completion/git-prompt.sh "$pkgdir"/usr/share/git/git-prompt.sh
  # more contrib stuff
  cp -a ./contrib/* $pkgdir/usr/share/git/ 
  # scripts are for python 2.x
  sed -i 's|#![ ]*/usr/bin/env python|#!/usr/bin/env python2|' \
    $(find "$pkgdir" -name '*.py') \
    "$pkgdir"/usr/lib/git-core/git-p4 \
    "$pkgdir"/usr/share/git/gitview/gitview

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

  # systemd stuff
  install -D -m 644 "$srcdir"/git-daemon@.service "$pkgdir"/usr/lib/systemd/system/git-daemon@.service
  install -D -m 644 "$srcdir"/git-daemon.socket "$pkgdir"/usr/lib/systemd/system/git-daemon.socket
}

md5sums=('3d598a31bd8ff04f6a72c65a4cd015a8'
         '0354726bd084cace4318142b53ce5aa2'
         '8e2648910fd5dd4f1c41d3c7fa9e9156'
         '2e42bf97779a1c6411d89043334c9e78'
         '042524f942785772d7bd52a1f02fe5ae'
         'f67869315c2cc112e076f0c73f248002')
