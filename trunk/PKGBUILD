# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=rsync
_tag='1a2d16c0bd161481cbf0acc06dceb1ce788f0d09' # git rev-parse v${pkgver}
pkgver=3.2.3
pkgrel=4
pkgdesc='A fast and versatile file copying tool for remote and local files'
arch=('x86_64')
url='https://rsync.samba.org/'
license=('GPL3')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'perl' 'popt' 'xxhash' 'libxxhash.so'
         'zlib' 'zstd')
makedepends=('git' 'python-commonmark')
backup=('etc/rsyncd.conf'
        'etc/xinetd.d/rsync')
validpgpkeys=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5') # Wayne Davison <wayned@users.sourceforge.net>
source=("git+https://github.com/WayneD/rsync#tag=${_tag}?signed"
        'rsyncd.conf')
sha256sums=('SKIP'
            '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b')

prepare() {
	cd "$srcdir/rsync"

	# rsync-ssl: Verify the hostname in the certificate when using openssl.
	git cherry-pick -n c3f7414c450faaf6a8281cc4a4403529aeb7d859

	# Force HAVE_LCHMOD off for Linux (for now).
	# Work around glibc's lchmod() issue a better way.
	git cherry-pick -n \
		85b8dc8abaca96fc3ea7421e09101b6ac41b6718 \
		9dd62525f3b98d692e031f22c02be8f775966503

	# Add test and fix regression for --delay-updates (#192) (#204)
	git cherry-pick -n efc81c93a9fca45ba08119145a2d282f477f01b4
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
