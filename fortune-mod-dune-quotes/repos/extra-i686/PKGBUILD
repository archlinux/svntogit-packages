# $Id$
# Maintainer: damir <damir@archlinux.org>
# TU : Kritoke <kritoke@gamebox.net>
# Maintainer: Kritoke <kritoke@gamebox.net>

pkgname=fortune-mod-dune-quotes
pkgver=2.0.1
pkgrel=1
pkgdesc="Quotes from the pre-Dune novels."
depends=('fortune-mod')
groups=('fortune-mods')
url="http://dune.s31.pl/"
source=(http://freshmeat.net/redir/fortune-mod-dune-quotes/18655/url_tgz/fortune-mod-dune-quotes.2.0.1.tar.gz)
md5sums=('5821793a7754ca07a18c5c08656b7371')

build() {
  cd $startdir/src/fortune-mod-dune-quotes.2.0.1
  mkdir -p $startdir/pkg/usr/share/fortune
  cp $startdir/src/fortune-mod-dune-quotes.2.0.1/* $startdir/pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}
