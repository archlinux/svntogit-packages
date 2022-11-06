# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.11.1
pkgrel=4
pkgdesc="Password and account management tool suite with support for shadow files and PAM"
arch=(x86_64)
url="https://github.com/shadow-maint/shadow"
license=(BSD)
depends=(
  acl libacl.so
  attr libattr.so
  audit libaudit.so
  glibc
  libxcrypt libcrypt.so
  pam libpam.so libpam_misc.so
)
makedepends=(docbook-xsl git itstool libcap libxslt)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/{chage,{,ch,chg}passwd,group{add,del,mems,mod},newusers,shadow,user{add,del,mod}}
)
options=(debug !emptydirs)
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/v4.11.1.arch2
source=(
  https://github.com/shadow-maint/shadow/releases/download/v$pkgver/shadow-$pkgver.tar.xz{,.asc}
  0001-Disable-replaced-tools-and-man-pages.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  0004-Add-Arch-Linux-defaults-for-etc-pam.d.patch
  shadow.{timer,service}
  useradd.defaults
)
sha512sums=('12fbe4d6ac929ad3c21525ed0f1026b5b678ccec9762f2ec7e611d9c180934def506325f2835fb750dd30af035b592f827ff151cd6e4c805aaaf8e01425c279f'
            'SKIP'
            '495edd2eb2c6ed36121fd5a73e112e5a7c7c15b10c00fc5cf31c8c8671a2317581f9d4468871b69d8302e18decf91e0ed4c37ea875e00a83a3bc14e7edcdd168'
            'f6c6ecf958714df3dd74cfef3e33f6d8def82645fdccbed034e330eeffe87a54491e774a237b18fb097695ed9314bb29f7ca39d8d93e642557f558daa0d0e9c3'
            '9aaddc6919b513adff5e07ba9f4cfefe294aa98ba60274d90cf56ba4bb0df8f4205e04aa7752bcd830d48d96bd30e4640a10cdaf1bb8472e87e1d4b67a313eb9'
            'a3d39d452a8ad51e8801be09f54b11ee18c1d8b1625c78e190b649923429c98ad6f06237a1fbfb2ccabbd8656dd46419444bf2b51bf433e3d89f14d9e2723270'
            'e4edf705dd04e088c6b561713eaa1afeb92f42ac13722bff037aede6ac5ad7d4d00828cfb677f7b1ff048db8b6788238c1ab6a71dfcfd3e02ef6cb78ae09a621'
            '67a49415f676a443f81021bfa29d198462008da1224086f8c549b19c2fd21514ca3302d5ac23edec28b9c724fef921596586423ebe41e852ebfbe7216af727e6'
            'e9ffea021ee4031b9ad3a534bfb94dbf9d0dfd45a55ecac5dedb2453ea0c17fb80bbb9ad039686bc1f3349dc371977eb548e3a665c56531469c22f29fc4eced8')
b2sums=('d459a1e0ffb342b6b455caf65e6af60b32eee72d4a9b1ab126485fb4632503a42061d3f0b960554c8155af6dc0564c585335b27aecca6538b394a0d58d927588'
        'SKIP'
        '1df7f3b7a7637f2977ee581fefa4a56f92ad57585d140bdd4aeef90e51a36568d7624657fdb81aa53b8114ca9d0bd8ba1eb67110c4bc8d36a4c26229b5170c0a'
        '2e17e67bd9671aeb6897c116b8ecf69acd0da073515ecc14fb42a83bafded0ad3532ddafcbed3e303d3f8511f7c5430bd50a9b8b808f578952eab476bdc46dfb'
        'c3145b63e42d2e25d702c59787889ebd13acdb1e97416119dd8dd5a6035f6c5f52c32f46c282f0ba4401c43c92bcc5fdb237c7b1d04c3a53da63e9774bf42a61'
        '85009831f3e2ad74801393b7d6351f0a553517706b2bd0a72daf379b903768ffcaa9696340abcbc489f3364e50ca5d287430b72cef0cf504d5e25728fe0dc8a4'
        '5cfc936555aa2b2e15f8830ff83764dad6e11a80e2a102c5f2bd3b7c83db22a5457a3afdd182e3648c9d7d5bca90fa550f59576d0ac47a11a31dfb636cb18f2b'
        '4a9cb6fe6658f2182655d42761d9d669654c6f0e891610e1b7fd256ce32a561f05e71daf8e473d98f16f5ee9d16d46a097a2d0de42eac58b4ce3be1525a74856'
        'd5bea0cfc2e6d3d1749c65440ca911533d41b6f8117fe09e9efec23524637cfa823d230303a7fbb45d3cd251bf8036d48b9b21049ced208f7ed191fcbd75e879')
validpgpkeys=(66D0387DB85D320F8408166DB175CFA98F192AF2)  # Serge Hallyn <sergeh@kernel.org>

prepare() {
  local filename

  cd $pkgname-$pkgver
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      printf "Applying patch %s\n" "${filename##*/}"
      patch -Np1 -i "$srcdir/${filename##*/}"
    fi
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --bindir=/usr/bin
    --sbindir=/usr/bin
    --libdir=/usr/lib
    --mandir=/usr/share/man
    --sysconfdir=/etc
    --disable-account-tools-setuid
    --enable-man
    --with-fcaps
    --with-libpam
    --with-group-name-max-length=32
    --with-audit
    --with-bcrypt
    --with-yescrypt
    --without-selinux
    --without-su
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # custom useradd(8) defaults (not provided by upstream)
  install -vDm 600 ../useradd.defaults "$pkgdir/etc/default/useradd"

  # systemd units
  install -vDm 644 ../shadow.timer -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../shadow.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vdm 755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"
}
