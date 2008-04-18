# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=spamassassin
pkgver=3.2.4
pkgrel=2
pkgdesc="A mail filter to identify spam."
arch=(i686 x86_64)
license=(APACHE)
url="http://spamassassin.apache.org"
depends=('perl>=5.10.0' 'perl-net-dns' 'perl-uri' 'perl-html-parser' \
		'perl-digest-sha1' 'perl-io-socket-ssl' 'openssl' \
		'perl-libwww' 'perl-io-zlib' 'perl-mail-spf' \
		'perl-archive-tar' 'zlib' 're2c')
makedepends=('razor' 'perl-dbi') 
backup=(etc/conf.d/spamd etc/mail/spamassassin/local.cf \
	etc/mail/spamassassin/init.pre \
	etc/mail/spamassassin/v310.pre \
	etc/mail/spamassassin/v312.pre \
	etc/mail/spamassassin/v320.pre)
install=$pkgname.install
options=(!emptydirs)
source=(http://www.devlib.org/apache/$pkgname/source/Mail-SpamAssassin-$pkgver.tar.gz \
		spamd.conf.d spamd)
md5sums=('81ec227d4d63aba08563ee868af9fbeb'
         'af501c6b0bb937a2775b747cc4b6d150'
         '6f1636c8a547345ea7fddcbbf106abf7')

build() {
  cd $startdir/src/Mail-SpamAssassin-$pkgver

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 /usr/bin/perl Makefile.PL INSTALLDIRS=vendor \
      CONTACT_ADDRESS=root@localhost ENABLE_SSL=yes PERL_TAINT=no
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete

  /bin/install -D -m644 $startdir/src/spamd.conf.d $startdir/pkg/etc/conf.d/spamd
  /bin/install -D -m755 $startdir/src/spamd $startdir/pkg/etc/rc.d/spamd
}
