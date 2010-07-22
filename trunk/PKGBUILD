# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.7.2
pkgrel=1
pkgdesc="the fast distributed version control system"
arch=(i686 x86_64)
url="http://git-scm.com/"
license=('GPL2')
depends=('curl' 'expat>=2.0' 'perl-error' 'perl>=5.10.0')
makedepends=('python')
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

md5sums=('652f861ae161e48979ef834707e2dc4c'
         '0ea16b997dea4aec1f2f3d9c6a74abb8'
         'd777ff1a239b3d810dcf5d89f9d894af'
         '9d065134210aa0dd3f2b40d12d915040')
sha256sums=('d06ac99eff6228b5a8d0daee0b9f3e71194e4cc365a48441ff027e18e3dba1ba'
            '5b6c6b401913fa018cae8a9578178ab233577fa6db118ba59e8563ab16ed9886'
            'd2741714a477029ca1ed63f8584040bcba6a53b2332028f9005feef4ae500113'
            '6e1475974fae315c55da344c0527923061ad7d9478d39396d147aea497f501b7')
