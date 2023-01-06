# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgbase=audit
pkgname=(audit python-audit)
pkgver=3.0.9
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=(x86_64)
makedepends=(glibc krb5 libcap-ng libldap linux-api-headers python swig)
license=(GPL2 LGPL2.1)
options=(debug emptydirs)
source=(
  $pkgbase-userspace-$pkgver.tar.gz::https://github.com/linux-audit/audit-userspace/archive/refs/tags/v$pkgver.tar.gz
  $pkgbase-3.0.8-config_paths.patch
  $pkgbase-3.0.9-flex_array_workaround.patch
  $pkgbase-3.0.9-undo_flex_array_workaround.patch
)
sha512sums=('c0b35d40d3aecb3450ce99422115efe40d56ad199d8f035f836dae94df0d55a4561659673c70fc49056a316bdc8531d7014f4c2a2d60aac66bdf69c262ee3ca0'
            'bc699123f810abcf9300728bf61d7fcfcc83677b75fbeb713fb24cc11b2f9edf687661aab70766acde7c3c41c6a62f8e0a54cdfb49d1c7ce2246b67fbe3feec5'
            '442bffac895abbd0abe455c36ebc03ed5a9faee16b57347ef1f37c0d9c33777e204da917be3bbe11c56173c2ec96eed60646ac7214da47f828eef5fa104c1ebb'
            '92ba0f9b3d3721bf64b56e2f3e2ac4e54b2b6acd9d5646a5ee97eea244cb165e19a56c362de16834925ae063c79e6505687749f1dd67dd0f2997919aea7cb2ef')
b2sums=('921db4ecce0ecd3d412003861f03bb4fd9a9e3b9f721a783cc2f70ad26666f8a4c2585051eac351606e699cda8f47d202cf12523747f19a647d5e2e416ff08a4'
        '50be1b4f76ace20d8d14b4c57a9bb69daa3da35fd654aca8730bc287682fe38f1c1917b37469fb087daf9f309ffc15cca15f54166ece0a055f540c2604778fc6'
        '2241c3dd29c803493ac8e85afd6031749a46b583514829b8761c24ae12061999b7c95107ec2948dd7edb239f805ca088b7b24229abb5445a4767702539779b0f'
        'd89110c32da33c2ca9292391ead930352e4c8935aa86111640130d9e3fbc0ebe27b069a83812530dfbbf28f4ddd33545658c8061d87bfac9a9d3a6a5ff0be4b8')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  # replace the use of /sbin with /usr/bin in configs
  patch -Np1 -d $pkgbase-userspace-$pkgver -i ../$pkgbase-3.0.8-config_paths.patch

  # fix broken userspace build due to swig: https://listman.redhat.com/archives/linux-audit/2022-February/018843.html
  cp -v /usr/include/linux/audit.h $pkgbase-userspace-$pkgver/lib/
  patch -Np1 -d $pkgbase-userspace-$pkgver -i ../$pkgbase-3.0.9-flex_array_workaround.patch

  cd $pkgbase-userspace-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --libexecdir=/usr/lib/audit
    --enable-gssapi-krb5=yes
    --enable-systemd=yes
    --with-libcap-ng=yes
  )

  cd $pkgbase-userspace-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
  [ -n "$SOURCE_DATE_EPOCH" ] && touch -h -d @$SOURCE_DATE_EPOCH bindings/swig/python/audit.py
}

package_audit() {
  depends=(glibc krb5 libkrb5.so libgssapi_krb5.so libcap-ng libcap-ng.so)
  provides=(libaudit.so libauparse.so)
  backup=(
    etc/libaudit.conf
    etc/audit/audit-stop.rules
    etc/audit/auditd.conf
    etc/audit/audisp-remote.conf
    etc/audit/zos-remote.conf
    etc/audit/plugins.d/af_unix.conf
    etc/audit/plugins.d/au-remote.conf
    etc/audit/plugins.d/audispd-zos-remote.conf
    etc/audit/plugins.d/syslog.conf
  )

  make DESTDIR="$pkgdir" install -C $pkgbase-userspace-$pkgver

  # undo fix for broken swig, so that other programs may use the header file correctly
  patch -Np0 -d "$pkgdir" -i "$srcdir/$pkgbase-3.0.9-undo_flex_array_workaround.patch"
  rm -v "$pkgdir/usr/include/libaudit.h.orig"

  # add log dir
  install -vdm 700 "$pkgdir/var/log/$pkgname"

  # remove legacy files
  rm -frv "$pkgdir/usr/lib/audit"

  (
    cd "$pkgdir"
    _pick python-audit usr/lib/python*
  )
}

package_python-audit() {
  depends=(audit libaudit.so libauparse.so glibc python)
  pkgdesc+=' (python bindings)'

  mv -v $pkgname/* "$pkgdir"
}

# vim: ts=2 sw=2 et:
