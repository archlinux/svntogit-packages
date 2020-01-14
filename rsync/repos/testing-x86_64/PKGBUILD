
pkgname=rsync
pkgver=3.1.3
pkgrel=3
pkgdesc="A file transfer program to keep remote files in sync"
arch=('x86_64')
url="https://rsync.samba.org/"
license=('GPL3')
depends=('acl' 'perl' 'popt' 'zlib')
backup=('etc/rsyncd.conf' 'etc/xinetd.d/rsync')
install=rsync.install
validpgpkeys=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5') # Wayne Davison <wayned@users.sourceforge.net>
source=("https://rsync.samba.org/ftp/rsync/src/$pkgname-$pkgver.tar.gz"{,.asc}
        'rsyncd.conf'
        'rsync.xinetd'
        'rsyncd.service'
        'rsyncd.socket'
        'rsyncd@.service')
sha256sums=('55cc554efec5fdaad70de921cd5a5eeb6c29a95524c715f3bbf849235b0800c0'
            'SKIP'
            '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b'
            'da0ec9ce07bf2edafbc8e44020da29a58038b00c3048a22de57017c56318a767'
            '6ad010a1f85f5637bdd0972403c032ca30d71608a36943c71c34ba1c5b463cd6'
            '551f17407de0e539c8419fc2cd48dd0124eb0253a186690b165b51703ffad1a5'
            '21983037aa116943b89ec982bc88e02c12376763e46f5ab25944cc1da29235ae')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure \
		--prefix=/usr \
		--with-included-popt=no \
		--with-included-zlib=no \
		--disable-debug
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"

	# rsync fails with xattr on btrfs...
	if [ "$(stat --file-system --printf=%T .)" = "btrfs" ]; then
		echo "Test is known to fail on btrfs..." >&2
		exit 1
	fi

	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
	install -Dm0644 ../rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
	install -Dm0644 ../rsyncd.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
	install -m0644 ../rsyncd.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
	install -m0644 ../rsyncd@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
	install -Dm0755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}
