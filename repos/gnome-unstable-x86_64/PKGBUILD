# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=evolution
pkgname=(
  evolution
  evolution-bogofilter
  evolution-spamassassin
)
pkgver=3.48.1
pkgrel=1
pkgdesc="Manage your email, contacts and schedule"
url="https://wiki.gnome.org/Apps/Evolution"
arch=(x86_64)
license=(GPL)
depends=(
  cmark
  enchant
  evolution-data-server
  gnome-autoar
  gnome-desktop
  gspell
  libcanberra
  libgweather-4
  libpst
  libytnef
  webkit2gtk-4.1
)
makedepends=(
  bogofilter
  cmake
  docbook-xsl
  git
  gtk-doc
  highlight
  intltool
  itstool
  networkmanager
  ninja
  spamassassin
  yelp-tools
)
options=(!emptydirs)
_commit=1645ae84c7a25892f3e4042101b9abf47ee903b5  # tags/3.48.1^0
source=("git+https://gitlab.gnome.org/GNOME/evolution.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgbase
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DLIBEXEC_INSTALL_DIR=/usr/lib
    -DSYSCONF_INSTALL_DIR=/etc

    -DENABLE_GTK_DOC=ON
    -DENABLE_SMIME=ON
  )

  cmake -S $pkgbase -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_evolution() {
  depends+=(
    libcamel-1.2.so
    libebook-1.2.so
    libebook-contacts-1.2.so
    libecal-2.0.so
    libedataserver-1.2.so
    libedataserverui-1.2.so
  )
  optdepends=(
    'evolution-bogofilter: Bogofilter spam check plugin'
    'evolution-spamassassin: Spamassassin spam check plugin'
    'highlight: text highlight plugin'
  )
  groups=(gnome-extra)

  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgdir"
  for x in bogofilter spamassassin; do
    _pick $x usr/lib/evolution/modules/module-$x.so
    _pick $x usr/share/metainfo/org.gnome.Evolution-$x.metainfo.xml
  done
}


package_evolution-bogofilter() {
  pkgdesc="Spam filtering for Evolution, using Bogofilter"
  depends=(
    "evolution=$pkgver"
    bogofilter
  )

  mv bogofilter/* "$pkgdir"
}

package_evolution-spamassassin() {
  pkgdesc="Spam filtering for Evolution, using SpamAssassin"
  depends=(
    "evolution=$pkgver"
    spamassassin
  )

  mv spamassassin/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
