# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=gtk2-themes-collection
pkgver=0.1.0
pkgrel=2
pkgdesc="Additional GTK2 Themes (and their coresponding metacity themes)"
arch=(i686 x86_64)
depends=(gtk2)
source=(http://art.gnome.org/download/themes/gtk2/733/GTK2-SnowLight.tar.bz2 \
        http://art.gnome.org/download/themes/gtk2/598/GTK2-Yattacier3.tar.gz \
        http://art.gnome.org/download/themes/gtk2/734/GTK2-industrial-myst.tar.bz2 \
        http://art.gnome.org/download/themes/gtk2/728/GTK2-toolbox-2.0.tar.gz \
        http://art.gnome.org/download/themes/gtk2/571/GTK2-Glossy_P.tar.gz \
        http://art.gnome.org/download/themes/gtk2/567/GTK2-Milk-2.0.tar.bz2 \
        http://art.gnome.org/download/themes/gtk2/712/GTK2-Tenebrific.tar.gz \
        http://art.gnome.org/download/themes/gtk2/213/GTK2-H2O-default-2.0.tar.gz \
        http://art.gnome.org/download/themes/gtk2/702/GTK2-Litoral.tar.gz)
url="http://art.gnome.org/themes/gtk2/?sort_by=popularity&thumbnails_per_page=12"

build() {
rm $startdir/src/*.tar.{gz,bz2}

mkdir -p $startdir/pkg/usr/share/themes

cd $startdir/src/

# make sure whitespaces are seen as filename parts
shopt -s dotglob

# start of loop
for i in * ; do

    # make sure, the var is in fact a dir
    if [ -d "$i" ]; then
      echo "==> $i "
      cd "$i"

      mkdir -p              $startdir/pkg/usr/share/themes/$i/
      mv gtk-2.0            $startdir/pkg/usr/share/themes/$i/

      if [ -d metacity-1 ]; then
        echo "      has metacity theme ..."
        mkdir -p          "$startdir/pkg/usr/share/themes/$i/"
        mv metacity-1     "$startdir/pkg/usr/share/themes/$i/"
      fi

      if [ -e index.theme ]; then
        echo "      has index.theme ..."
        cp index.theme    "$startdir/pkg/usr/share/themes/$i/index.theme"
      fi
      echo "==> [done] "
      cd $startdir/src/
    fi
done

}
