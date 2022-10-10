# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh
pkgver=9.0p1
pkgrel=1
pkgdesc='Premier connectivity tool for remote login with the SSH protocol'
arch=('x86_64')
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
depends=(
  'glibc'
  'krb5' 'libkrb5.so' 'libgssapi_krb5.so'
  'ldns'
  'libedit'
  'libxcrypt' 'libcrypt.so'
  'openssl'
  'pam' 'libpam.so'
  'zlib'
)
makedepends=('libfido2' 'linux-headers')
optdepends=(
  'libfido2: FIDO/U2F support'
  'x11-ssh-askpass: input passphrase in X'
  'xorg-xauth: X11 forwarding'
)
backup=(
  'etc/pam.d/sshd'
  'etc/ssh/ssh_config'
  'etc/ssh/sshd_config'
)
options=('debug')
install=install
source=(
  "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname}-${pkgver}.tar.gz"{,.asc}
  "$pkgname-9.0p1-sshd_config.patch"
  'sshdgenkeys.service'
  'sshd.service'
  'sshd.conf'
  'sshd.pam'
)
sha256sums=('03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a'
            'SKIP'
            '27e43dfd1506c8a821ec8186bae65f2dc43ca038616d6de59f322bd14aa9d07f'
            '4031577db6416fcbaacf8a26a024ecd3939e5c10fe6a86ee3f0eea5093d533b7'
            'e40f8b7c8e5e2ecf3084b3511a6c36d5b5c9f9e61f2bb13e3726c71dc7d4fbc7'
            '4effac1186cc62617f44385415103021f72f674f8b8e26447fc1139c670090f6'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846')
b2sums=('49724a400951964d659d136908657940f79e150056728cc4dadf8ff8652a832f7fd46eebb47b15085e57fca4b00c77d1ec4dd1b056ea2bbcee89f54a121ed5e2'
        'SKIP'
        '29e1a1c2744e0234830c6f93a46338ea8dc943370e20a24883d207d611025e54643da678f2826050c073a36be48dfdc7329d4cfb144c2ff90607a5f10f73dc59'
        '62f89107d3648a359b0307497a9f105d7ff1dddddb38a64afe3261000b5db494a5530e4b60a9aa1d7be4413599e54b72e2f53f0de8c1ff263a46a70bc5695c29'
        '07ad5c7fb557411a6646ff6830bc9d564c07cbddc4ce819641d31c05dbdf677bfd8a99907cf529a7ee383b8c250936a6423f4b4b97ba0f1c14f627bbd629bd4e'
        '27571f728c3c10834a81652f3917188436474b588f8b047462e44b6c7a424f60d06ce8cb74839b691870177d7261592207d7f35d4ae6c79af87d6a7ea156d395'
        '557d015bca7008ce824111f235da67b7e0051a693aaab666e97b78e753ed7928b72274af03d7fde12033986b733d5f996faf2a4feb6ecf53f39accae31334930')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  patch -Np1 -d "$pkgname-$pkgver" -i ../$pkgname-9.0p1-sshd_config.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/ssh \
    --sysconfdir=/etc/ssh \
    --disable-strip \
    --with-ldns \
    --with-libedit \
    --with-security-key-builtin \
    --with-ssl-engine \
    --with-pam \
    --with-privsep-user=nobody \
    --with-kerberos5=/usr \
    --with-xauth=/usr/bin/xauth \
    --with-pid-dir=/run \
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin' \

  make
}

check() {
  cd "${pkgname}-${pkgver}"

  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
  install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
  install -Dm644 ../sshd.conf "${pkgdir}"/usr/lib/tmpfiles.d/sshd.conf
  install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

  install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
  install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
  install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1
}

# vim: ts=2 sw=2 et:
