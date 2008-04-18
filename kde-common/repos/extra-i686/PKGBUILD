# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kde-common
pkgver=3.5.9
kdever=3.5.9 # if minor is 0, then without .0
pkgrel=1
pkgdesc="Artwork and config stuff for KDE"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.kde.org"
groups=('kde')
depends=('bash' 'archlinux-menus')
backup=('opt/kde/share/apps/kdm/faces/.default.face.icon' \
	'opt/kde/share/config/kdm/kdmrc' 'opt/kde/share/config/kdm/backgroundrc' \
	'etc/pam.d/kde-np' 'etc/pam.d/kde')
install=kde-common.install
source=(kdm etc.pam \
	ftp://ftp.archlinux.org/other/kde-graphics/arch-default-background.svg \
	ftp://ftp.archlinux.org/other/kde-graphics/arch-kdeshutdown.png \
	ftp://ftp.archlinux.org/other/kde-graphics/arch-kdm.png \
	ftp://ftp.archlinux.org/other/kde-graphics/kde-arch-splash-0.7.2.tar.bz2 \
	kde-defaults.tar kde.profile kde.tcsh \
	agent-shutdown.sh agent-startup.sh kdm.kdmrc kdm.backgroundrc kde.pam kde-dbus.conf)


build() {
  # Add kdm startup script to /etc/rc.d and a pam script
  install -D -m755 -o root -g root $startdir/src/kdm $startdir/pkg/etc/rc.d/kdm
  install -D -m644 -o root -g root $startdir/src/etc.pam $startdir/pkg/etc/pam.d/kde-np
  install -D -m644 -o root -g root $startdir/src/kde.pam $startdir/pkg/etc/pam.d/kde

  # Add a kde profile
  install -D -m755 $startdir/src/kde.profile $startdir/pkg/etc/profile.d/kde.sh

  # Add a tcsh kde profile
  install -D -m755 $startdir/src/kde.tcsh $startdir/pkg/etc/profile.d/kde.csh

  # Add a dbus config file
  install -d -m755 ${startdir}/pkg/opt/kde/share/dbus-1/services
  touch ${startdir}/pkg/opt/kde/share/dbus-1/services/.keep 
  install -D -m644 $startdir/src/kde-dbus.conf $startdir/pkg/etc/dbus-1/session.d/kde.conf

  # Adding new defaults for kde
  install -D -m 644 $startdir/src/kcmnspluginrc $startdir/pkg/opt/kde/share/config/kcmnspluginrc
  install -D -m 644 $startdir/src/kdeglobals 	$startdir/pkg/opt/kde/share/config/kdeglobals
  install -D -m 644 $startdir/src/kdesktoprc 	$startdir/pkg/opt/kde/share/config/kdesktoprc
  install -D -m 644 $startdir/src/konquerorrc 	$startdir/pkg/opt/kde/share/config/konquerorrc
  # Adding Arch graphics for kde
  install -D -m 644 $startdir/src/arch-default-background.svg \
  $startdir/pkg/opt/kde/share/wallpapers/arch-default-background.svg

  install -D -m 644 $startdir/src/arch-kdm.png \
  $startdir/pkg/opt/kde/share/apps/kdm/faces/.default.face.icon

  install -D -m 644 $startdir/src/arch-kdm.png \
  $startdir/pkg/opt/kde/share/apps/kdm/pics/users/arch-kdm.png

  install -D -m 644 $startdir/src/arch-kdeshutdown.png \
  $startdir/pkg/opt/kde/share/apps/ksmserver/pics/shutdownkonq.png

  # Adding arch splash screen
  cd $startdir/src/kde-arch-splash-0.7.2
  for i in *.png; do
  install -D -m 644 $i $startdir/pkg/opt/kde/share/apps/ksplash/Themes/kde-arch-splash-0.7.2/$i
  done
  install -D -m 644 Theme.rc $startdir/pkg/opt/kde/share/apps/ksplash/Themes/kde-arch-splash-0.7.2/Theme.rc
  install -D -m 644 ksplashrc $startdir/pkg/opt/kde/share/config/ksplashrc

  # Adding KDM config
  install -D -m 644 $startdir/src/kdm.kdmrc $startdir/pkg/opt/kde/share/config/kdm/kdmrc
  install -D -m 644 $startdir/src/kdm.backgroundrc $startdir/pkg/opt/kde/share/config/kdm/backgroundrc

  # Adding startup/shutdown agents for ssh and gpg-agent
  install -m644 -D $startdir/src/agent-startup.sh $startdir/pkg/opt/kde/env/agent-startup.sh
  install -m755 -D $startdir/src/agent-shutdown.sh $startdir/pkg/opt/kde/shutdown/agent-shutdown.sh

  # fixup kde icons for gnome
  mkdir -p $startdir/pkg/opt/kde/share/icons/gnome/{128x128,64x64,32x32,16x16,48x48,22x22,scalable}
  mkdir -p $startdir/pkg/opt/kde/share/icons/crystalsvg/{128x128/apps,64x64/apps,32x32/apps,16x16/apps,48x48/apps,22x22/apps,scalable/apps}
  cd $startdir/pkg/opt/kde/share/icons/gnome/
  for i in * 
  do cd $i
  ln -sf ../../crystalsvg/$i/apps/ apps
  cd ..
  done
}
md5sums=('31c5c02fc1bdc65dc3d86c9a0c89a48a'
         '39ee0904b253dc5d80d693f1f04cdd8f'
         '23432d7861d68fa6e0d46e2f1fd71ab6'
         '2c7e8532ed900d73d47ed439ce2b76a8'
         '7f8c4745bdc4cc35104ffac76d584f1c'
         '7326ea4e34aecc4fd602947be16df225'
         '6f98e9e211c2edf3a7e542c4570bac90'
         'a6fa157bd78625b8e62d73ff3b037f06'
         '253960d9ebf4f9cb002199b793845e03'
         '18e8d01124b19f7df2937c06e177bf7f'
         'c963ef6e37c9051119972a58c67f05fb'
         'e36ec25f8d21ce6f22bfb8afddd4094a'
         'e5f64a946c2c04005cc8148373762b5c'
         '89128638fc255594830e38e1d60c8e89'
         'd08b320ab4f7508fb8d6b841117fb6fa')
