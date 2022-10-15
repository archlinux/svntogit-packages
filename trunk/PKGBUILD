# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.11.1
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM"
arch=('x86_64')
url='https://github.com/shadow-maint/shadow'
license=('BSD')
# libcap-ng needed by install scriptlet for 'filecap'
depends=(
  'acl' 'libacl.so'
  'attr' 'libattr.so'
  'audit' 'libaudit.so'
  'glibc'
  'libcap-ng' 'libcap-ng.so'
  'libxcrypt' 'libcrypt.so'
  'pam' 'libpam.so' 'libpam_misc.so'
)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/{chage,passwd,shadow,useradd,usermod,userdel}
  etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
  etc/pam.d/{chgpasswd,groupmems}
)
options=('!emptydirs')
install=shadow.install
source=(
  "https://github.com/shadow-maint/shadow/releases/download/v$pkgver/shadow-$pkgver.tar.xz"{,.asc}
  LICENSE
  chgpasswd
  chpasswd
  defaults.pam
  login.defs
  newusers
  passwd
  shadow.{timer,service}
  useradd.defaults
)
sha512sums=('12fbe4d6ac929ad3c21525ed0f1026b5b678ccec9762f2ec7e611d9c180934def506325f2835fb750dd30af035b592f827ff151cd6e4c805aaaf8e01425c279f'
            'SKIP'
            '62efcede35948e4a2f367362590723d7b3a2dde8a079baa9721069194bc924b16869c871ac824a73d56129ca620aaba0bfde5886a7146c1f8b1a155d06cb9b53'
            'aef316f283a0ba0387afd5bd049b20d748dcfe8aebc5f5ea1ce1308167d6a578ae7d0007a5ed4d9862de7d377851edd2c8771e1fb1076262468078c2c76e42fc'
            'dc75dfeafa901f9988176b82ef9db5d927dfe687a72ca36ca13ba3e7ac1b0c8055db1104373f2a7ac463e156f079cbc1f0a9f5e6e16b9f74153eb63dcb8f96df'
            '41c856d893c4157b158d79341fe2b1892be463e17f7a007f1c17397b5625c1d2d5671bc0b37879064ae715a918fb9b05c32d18d1aaa64284cddd8ecbda9b2434'
            'edc3becca531dfa791fbeace4ae159e9d760689b979e8892c6eb60b93b12e1a88648ef23602d1ad3fd0ebcbed088bce5bed6eba4444cdb7165f91becce5856a1'
            'dc75dfeafa901f9988176b82ef9db5d927dfe687a72ca36ca13ba3e7ac1b0c8055db1104373f2a7ac463e156f079cbc1f0a9f5e6e16b9f74153eb63dcb8f96df'
            '4fb7474ea9dedf86e4c65bf18f503a6d8c00d477a7c32be3cfdfd026bd62ef866d009c50e5a2dc2101bea332c5697bc1e0d55225f39c83252860f5b9b7461aeb'
            'e4edf705dd04e088c6b561713eaa1afeb92f42ac13722bff037aede6ac5ad7d4d00828cfb677f7b1ff048db8b6788238c1ab6a71dfcfd3e02ef6cb78ae09a621'
            '67a49415f676a443f81021bfa29d198462008da1224086f8c549b19c2fd21514ca3302d5ac23edec28b9c724fef921596586423ebe41e852ebfbe7216af727e6'
            'b681401895de553674cfc7f51809565db03cb4351f85b492460d09abfd703e73c41ba1dfd708964e0f6ea356dc9c929818c62e7d740d55fb795a2e9b7de271fc')
b2sums=('d459a1e0ffb342b6b455caf65e6af60b32eee72d4a9b1ab126485fb4632503a42061d3f0b960554c8155af6dc0564c585335b27aecca6538b394a0d58d927588'
        'SKIP'
        'f3d3eaedb1cd8952d47614fe6e20bf9f84d44704963a921c97ddba40e1c570063bc582c78b1c9cfeebfc30657453ea5940f8cce56d6b6bde18270bdfafb6e78a'
        '31e74eebedf8cb6e5ade36096b4399892d7091b9dce4645fde591f64802dc8befd73ae8019e78f8d326a605b224c7828694d21788bd6073db43c41cf5a9c2805'
        '1518839dbfe12f2f55190976de808515f93eb8c06f1570f02780a5ce8c237e0be43aa7cd0fbbe4c88af1f641586e4d3cf122896d97c7594ef72991e1801ee666'
        '5fde901d7d29995523cf261de973cc053265f37cf8fecc5511ccfff35a6ef4308f8cf36dc94e37c8b7604694ffa6ab87331c9b533b3538c6f7d7d911c9f94d19'
        'db8e794f6b55e00acebeb89a57e4b40facba8d0c039b5d9bcd6ff58a9e44639cffe826c6fb23744fd3c52de3c5b4a7a5ac28917d552980fb8a6d9f347f2a4028'
        '1518839dbfe12f2f55190976de808515f93eb8c06f1570f02780a5ce8c237e0be43aa7cd0fbbe4c88af1f641586e4d3cf122896d97c7594ef72991e1801ee666'
        '5b4e20609d38dcec82eae66acdfb7d45288574e7bf9684fa0f66bc0fb1c45cd78ee503d04a5084e28755fb7a1c6cea95854c93b33d76ab20964f45420c68403c'
        '5cfc936555aa2b2e15f8830ff83764dad6e11a80e2a102c5f2bd3b7c83db22a5457a3afdd182e3648c9d7d5bca90fa550f59576d0ac47a11a31dfb636cb18f2b'
        '4a9cb6fe6658f2182655d42761d9d669654c6f0e891610e1b7fd256ce32a561f05e71daf8e473d98f16f5ee9d16d46a097a2d0de42eac58b4ce3be1525a74856'
        '75738ba7705fe4f8c22d07bff738a5c2c3bc0fd44d9aaca170cb4e6e7bb3f1e05f729f6decfaa4dec8a037e09fdea83b3500aaa8d6693fd4ae20d7fb0ede420e')
validpgpkeys=('66D0387DB85D320F8408166DB175CFA98F192AF2')  # Serge Hallyn <sergeh@kernel.org>

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --disable-account-tools-setuid \
    --with-libpam \
    --with-group-name-max-length=32 \
    --with-audit \
    --without-selinux \
    --without-su

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/shadow/LICENSE"

  # useradd defaults
  install -Dm600 "$srcdir/useradd.defaults" "$pkgdir/etc/default/useradd"

  # systemd units
  install -D -m644 "$srcdir/shadow.timer" "$pkgdir/usr/lib/systemd/system/shadow.timer"
  install -D -m644 "$srcdir/shadow.service" "$pkgdir/usr/lib/systemd/system/shadow.service"
  install -d -m755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"

  # login.defs
  install -Dm644 "$srcdir/login.defs" "$pkgdir/etc/login.defs"

  # PAM config - custom
  rm "$pkgdir/etc/pam.d"/*
  install -t "$pkgdir/etc/pam.d" -m644 "$srcdir"/{passwd,chgpasswd,chpasswd,newusers}

  # PAM config - from tarball
  install -Dm644 etc/pam.d/groupmems "$pkgdir/etc/pam.d/groupmems"

  # we use the 'useradd' PAM file for other similar utilities
  for file in chage groupadd groupdel groupmod shadow \
      useradd usermod userdel; do
    install -Dm644 "$srcdir/defaults.pam" "$pkgdir/etc/pam.d/$file"
  done

  # Remove evil/broken tools
  rm "$pkgdir"/usr/sbin/logoutd

  # Remove utilities provided by util-linux
  rm \
      "$pkgdir"/usr/bin/{login,chsh,chfn,sg,nologin} \
      "$pkgdir"/usr/sbin/{vipw,vigr}

  # but we keep newgrp, as sg is really an alias to it
  mv "$pkgdir"/usr/bin/{newgrp,sg}

  # ...and their many man pages
  find "$pkgdir"/usr/share/man \
      '(' -name 'chsh.1'    -o \
          -name 'chfn.1'    -o \
          -name 'su.1'      -o \
          -name 'logoutd.8' -o \
          -name 'login.1'   -o \
          -name 'nologin.8' -o \
          -name 'vipw.8'    -o \
          -name 'vigr.8'    -o \
          -name 'newgrp.1' ')' \
      -delete

  # move everything else to /usr/bin, because this isn't handled by ./configure
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir/usr/sbin"
}
