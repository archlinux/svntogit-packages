# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=pathological
pkgver=1.1.3
pkgrel=4
pkgdesc="A puzzle game with the same feel as frozen bubble"
arch=('i686' 'x86_64')
url="http://pathological.sourceforge.net/"
license=('GPL')
depends=('python-pygame')
install=pathological.install
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz
        pathological.desktop)
md5sums=('76a446080c0fed12baf39354d8e0ce4a' '0fbf64860efe3d287eb74681758c4f75')
sha1sums=('70b1c9e12704c7fd3b301aa90bceee2e8373b7b9' '9b57f854ce9621542d810a21c61325de343950d7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  make write-highscores || return 1
  
  sed -i -e 's|/usr/lib/pathological/bin/write-highscores|/usr/share/pathological/write-highscores|' pathological.py
  sed -i -e 's|/var/games/pathological_scores|/usr/share/games/pathological/pathological_scores|' pathological

  # silence python from complaining about missing encoding
  p_has__coding=`head -n3 pathological.py | grep coding`
  if [ -z "${p_has__coding}" ]; then
    head -n1 pathological.py > p.tmp
    echo "# -*- coding: utf-8 -*-" >> p.tmp
    p_num_lines=`wc -l pathological.py | awk '{ print $1 }'`
    p_num_lines=`expr ${p_num_lines} - 1`
    tail -n${p_num_lines} pathological.py >> p.tmp
    mv p.tmp pathological.py
  fi

  mkdir -p ${startdir}/pkg/usr/share/games/pathological
  cp -r circuits graphics music sounds \
	${startdir}/pkg/usr/share/games/pathological/
  chmod 755 ${startdir}/pkg/usr/share/games/pathological/*

  install -m755 pathological.py \
                 ${startdir}/pkg/usr/share/games/pathological
  install -m2755 -g100 write-highscores \
                       ${startdir}/pkg/usr/share/games/pathological

  mkdir -p ${startdir}/pkg/usr/share/{pixmaps,applications}
  install -m644 pathological.xpm ${startdir}/pkg/usr/share/pixmaps/
  install -m644 ${startdir}/src/pathological.desktop \
                ${startdir}/pkg/usr/share/applications/

  rm ${startdir}/pkg/usr/share/games/pathological/graphics/*.xcf

  mkdir -p ${startdir}/pkg/usr/man/man6
  install -m0644 pathological.6.gz ${startdir}/pkg/usr/man/man6

  mkdir -p ${startdir}/pkg/usr/bin
  install -m755 pathological ${startdir}/pkg/usr/bin
}
