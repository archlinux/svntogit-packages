# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.7.3.1
pkgrel=2
pkgdesc="the fast distributed version control system"
arch=(i686 x86_64)
url="http://git-scm.com/"
license=('GPL2')
depends=('curl' 'expat>=2.0' 'perl-error' 'perl>=5.10.0')
makedepends=('python2')
optdepends=('tk: gitk and git gui'
            'perl-libwww: git svn'
            'perl-term-readkey: git svn'
            'perl-net-smtp-ssl: git send-email TLS support'
            'subversion: git svn'
            'cvsps: git cvsimport')
replaces=('git-core')
provides=('git-core')
backup=('etc/conf.d/git-daemon.conf')
source=("http://kernel.org/pub/software/scm/git/${pkgname}-${pkgver}.tar.bz2" \
        "http://kernel.org/pub/software/scm/git/git-manpages-${pkgver}.tar.bz2"
        git-daemon
        git-daemon.conf)

build() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr gitexecdir=/usr/lib/git-core || return 1
}

package() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    INSTALLDIRS=vendor DESTDIR=${pkgdir} install || return 1

  # bash completion
  mkdir -p $pkgdir/etc/bash_completion.d/
  install -m644 ./contrib/completion/git-completion.bash $pkgdir/etc/bash_completion.d/git || return 1

  # more contrib stuff
  cp -a ./contrib $pkgdir/usr/share/git/ || return 1

  # scripts are for python 2.x
  sed -i 's|#![ ]*/usr/bin/env python|#!/usr/bin/env python2|' \
    $(find "$pkgdir" -name '*.py') \
    "$pkgdir"/usr/share/git/{fast-import/git-p4,gitview/gitview}

  # emacs interface
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  mv $pkgdir/usr/share/git/emacs $pkgdir/usr/share/emacs/site-lisp/git
  rm $pkgdir/usr/share/emacs/site-lisp/git/.gitignore

  # how 'bout some manpages?
  for mansect in man1 man5 man7; do
    for manpage in $srcdir/$mansect/*; do
      install -D -m644 $manpage $pkgdir/usr/share/man/$mansect/$(basename $manpage)
    done
  done

  # remove perllocal.pod, .packlist, and empty directories.
  rm -rf $pkgdir/usr/lib/perl5

  # git daemon script
  install -D -m755 $srcdir/git-daemon $pkgdir/etc/rc.d/git-daemon
  install -D -m644 $srcdir/git-daemon.conf $pkgdir/etc/conf.d/git-daemon.conf
}

md5sums=('77e1611498919965fb65fd1f229ee155'
         '41a164c1ad025e0970b2365e27209a11'
         'd777ff1a239b3d810dcf5d89f9d894af'
         '9d065134210aa0dd3f2b40d12d915040')
sha256sums=('d0ac26b1bf3ec5af0853730a10edf9dc5f51a99d7590ab85676928bc3a44dae9'
            '3b9c653f0d4770997fa460a25aae522238743295f6372d6bc7deccea1846c0f2'
            'd2741714a477029ca1ed63f8584040bcba6a53b2332028f9005feef4ae500113'
            '6e1475974fae315c55da344c0527923061ad7d9478d39396d147aea497f501b7')
