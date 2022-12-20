# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=rsync
_tag='b13e7a8ef4fa430223f66403506fb821caae5cfd' # git rev-parse v${pkgver}
pkgver=3.2.7
pkgrel=3
pkgdesc='A fast and versatile file copying tool for remote and local files'
arch=('x86_64')
url='https://rsync.samba.org/'
license=('GPL3')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'popt' 'xxhash' 'libxxhash.so'
         'zlib' 'zstd')
optdepends=('python: for rrsync')
makedepends=('git' 'python-commonmark')
options=('debug')
backup=('etc/rsyncd.conf'
        'etc/xinetd.d/rsync')
validpgpkeys=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5') # Wayne Davison <wayned@users.sourceforge.net>
source=("git+https://github.com/WayneD/rsync#tag=${_tag}?signed"
        'rsyncd.conf')
sha256sums=('SKIP'
            '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b')

_backports=(
)

_reverts=(
)

prepare() {
  cd "$srcdir/rsync"

  local _c
  for _c in "${_backports[@]}"; do
    if [[ $_c == *..* ]]; then
      git log --oneline --reverse "${_c}"
    else
      git log --oneline -1 "${_c}"
    fi
    git cherry-pick -n -m1 "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done
}

build() {
  cd "$srcdir/rsync"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --with-included-popt=no \
    --with-included-zlib=no
  make
}

check() {
  cd "$srcdir/rsync"

  make test
}

package() {
  cd "$srcdir/rsync"

  make DESTDIR="$pkgdir" install
  install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm0644 packaging/lsb/rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
  install -Dm0644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
  install -Dm0644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
  install -Dm0644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
  install -Dm0755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}
