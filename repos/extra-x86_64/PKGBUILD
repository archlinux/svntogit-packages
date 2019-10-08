# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=mercurial
pkgver=5.1.2
pkgrel=1
pkgdesc='A scalable distributed SCM tool'
arch=(x86_64)
url="https://www.mercurial-scm.org/"
license=(GPL)
depends=(python2)
optdepends=('tk: for the hgk GUI')
backup=(etc/mercurial/hgrc)
validpgpkeys=(2BCCE14F5C6725AA2EA8AEB7B9C9DC824AA5BDD5
              3A8155163D0E20A530FCB78647A67FFAA346AACE)  
source=(https://www.mercurial-scm.org/release/${pkgname}-${pkgver}.tar.gz{,.asc}
        mercurial.profile)
sha256sums=('15af0b090b23649e0e53621a88dde97b55a734d7cb08b77d3df284db70d44e2e'
            'SKIP'
            '87427151713e689cd87dc50d50c048e0e58285815e4eb61962b50583532cbde5')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's#env python#env python2#' mercurial/lsprof.py contrib/hg-ssh
}

build() {
  cd $pkgname-$pkgver/contrib/chg
  make
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -d "$pkgdir/usr/share/man/"{man1,man5}
  install -m644 doc/hg.1 "$pkgdir/usr/share/man/man1"
  install -m644 doc/{hgrc.5,hgignore.5} "$pkgdir/usr/share/man/man5"
  install -m644 -D contrib/zsh_completion "$pkgdir/usr/share/zsh/site-functions/_hg"
  install -m644 -D contrib/bash_completion "$pkgdir/usr/share/bash-completion/completions/hg"

  make -C contrib/chg DESTDIR="$pkgdir" PREFIX=/usr install
  install -m755 contrib/hg-ssh "$pkgdir/usr/bin"
  install -m755 contrib/hgk "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 contrib/{mq.el,mercurial.el} "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 contrib/vim/HGAnnotate.vim \
    "$pkgdir/usr/share/vim/vimfiles/syntax/HGAnnotate.vim"

  # set some variables
  install -m755 -d "$pkgdir/etc/profile.d"
  install -m755 "$srcdir/mercurial.profile" "$pkgdir/etc/profile.d/mercurial.sh"

  # FS#38825 - Add certs config to package
  install -m755 -d "$pkgdir/etc/mercurial"
  cat <<-EOF > "$pkgdir/etc/mercurial/hgrc"
	[web]
	cacerts = /etc/ssl/certs/ca-certificates.crt
	EOF
}
