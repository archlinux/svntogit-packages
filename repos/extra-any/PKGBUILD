# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=deluge
pkgver=1.3.15+18+ge050905b2
pkgrel=1
pkgdesc="A BitTorrent client with multiple user interfaces in a client/server model"
arch=(any)
url="https://deluge-torrent.org/"
license=(GPL3)
depends=(python2-xdg libtorrent-rasterbar python2-twisted python2-pyopenssl
         python2-chardet python2-setuptools)
makedepends=(intltool pygtk librsvg python2-mako git)
optdepends=('python2-notify: libnotify notifications'
            'python2-pygame: audible notifications'
            'python2-libappindicator: appindicator notifications'
            'pygtk: needed for gtk ui'
            'librsvg: needed for gtk ui'
            'python2-mako: needed for web ui')
_commit=e050905b291f4d9b417270e38f2aa04366057919  # 1.3-stable
source=("git://git.deluge-torrent.org/deluge.git#commit=$_commit"
        untag-build.patch
        deluged.service deluge-web.service)
sha256sums=('SKIP'
            'fbd17f13765f5560bab01a81a42aff0f2f757a4a6fa29379ae31d95b9721e4f2'
            '58a451bb6cf4fe6ff78a4fb71d51c5910340a2de032ff435c3c7365015ab538f'
            'c3f2d6ad5bc9de5ffd9973d92badbe04a9ecf12c0c575e13d505a96add03275a')

prepare() {
  cd $pkgname
  patch -Np1 -i ../untag-build.patch
  sed -i '1s/python$/&2/' \
    deluge/ui/Win32IconImagePlugin.py \
    deluge/ui/web/gen_gettext.py
}

pkgver() {
  cd $pkgname
  git describe | sed 's/^deluge-//;s/-/+/g'
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dt "$pkgdir/usr/lib/systemd/system" -m644 ../*.service
  echo 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'd /srv/deluge 0775 deluge deluge' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
