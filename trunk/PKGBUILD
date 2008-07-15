# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=git
pkgver=1.5.6.3
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
  cd ${startdir}/src/${pkgname}-${pkgver}
  make THREADED_DELTA_SEARCH=1 prefix=/usr || return 1
  make THREADED_DELTA_SEARCH=1 prefix=/usr \
    INSTALLDIRS=vendor DESTDIR=${startdir}/pkg install
  
  # let's plop gitweb in /usr/share
  cp -dR ./gitweb ${startdir}/pkg/usr/share/gitweb

  #bash completion
  mkdir -p ${startdir}/pkg/etc/bash_completion.d/
  install -m644 ./contrib/completion/git-completion.bash ${startdir}/pkg/etc/bash_completion.d/git

  # how 'bout some manpages?
  for mansect in man1 man5 man7; do
    for manpage in ${startdir}/src/${mansect}/*; do
      install -D -m644 $manpage ${startdir}/pkg/usr/share/man/${mansect}/$(basename $manpage)
    done
  done

  # remove perllocal.pod, .packlist, and empty directories.
  rm -rf ${startdir}/pkg/usr/lib
}

md5sums=('bc1b4280b460356aac67029fae43d4c3'
         '3e9f48e18084f42c6f9c520e592884ab')
