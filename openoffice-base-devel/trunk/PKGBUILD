# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>

pkgname=openoffice-base-devel
pkgver=2.4_src680_m239
pkgrel=1
pkgdesc="OpenOffice.org - a free multiplatform and multilingual office suite"
arch=(i686 x86_64)
_OO_milestone=src680-m239
#_OO_milestone=SRC680_m239
license=('LGPL')
url="http://www.openoffice.org"
install=openoffice.install
depends=('ttf-dejavu' 'curl' 'desktop-file-utils' 'fontconfig>=2.4' 'gtk2>=2.10.11'
         'hunspell>=1.1.5' 'perl' 'python>=2.5' 'libwpd' 'libsndfile'
         'startup-notification>=0.9' 'xalan-java' 'libxaw' 'libcups' 'hsqldb-java'
         'gstreamer0.10-base' 'neon>=0.27.0' 'dbus-glib' 'nss' 'pstoedit') # 'xmlsec' - broken # "icu>=3.8" broken
# for gnu java/ecj
makedepends=('bison' 'cvs' 'curl' 'findutils'
             'flex' 'gawk' 'gcc-libs' 'kdelibs' 'libart-lgpl' 'pam' 'sane' 'zip'
             'perl-archive-zip' 'pkgconfig'  'unzip' 'xulrunner>=1.8.1.3'
             'java-gcj-compat' 'apache-ant' 'cairo')	# 'boost' - we use internal one. jfreereport is broken
# for SUN Java
#makedepends=('boost' 'bison' 'cvs' 'curl' 'findutils'
#             'flex' 'gawk' 'gcc-libs' 'kdelibs' 'libart-lgpl' 'pam' 'sane' 'zip'
#             'perl-archive-zip' 'pkgconfig' 'unzip' 'xulrunner>=1.8.1.3'
#             'jdk' 'apache-ant' 'cairo')
provides=('openoffice-base')

#MIRROR="ftp://ftp.gwdg.de/pub/openoffice/" # has all late but is fast
#MIRROR=http://ftp.rz.tu-bs.de/pub/mirror/OpenOffice.org/
#MIRROR=ftp://ftp-1.gwdg.de/pub/openoffice/developer
#MIRROR=ftp://ftp.linux.cz/pub/localization/OpenOffice.org/
MIRROR=http://download.go-oo.org/SRC680

source=(#$MIRROR/stable/${pkgver}/OOo_${pkgver}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/contrib/rc/${pkgver}/OOo_${pkgver}_${_OO_milestone}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/contrib/rc/${pkgver}/OOo_${_OO_milestone}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/contrib/rc/2.2.0rc3/OOo_${pkgver}rc3_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/contrib/rc/2.2.0rc4/OOo_${pkgver}rc4_${_OO_milestone}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/stable/${pkgver}/OOo_${pkgver}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/devel/build/Sources/OOo_${pkgver}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/SRC680_m223/OOo-Dev_SRC680_m224_src_{core,binfilter,system}.tar.bz2
	$MIRROR/${_OO_milestone}-{core,binfilter,system}.tar.bz2
	intro.bmp
	template.desktop
	default-no-startup-wizard_oog680_m1.diff
	default-system-fpicker_oog680_m1.diff
	jvmfwk-gij-paths_src239.diff
	gstreamer-support_src239.diff
	fix-font-hinting_src237.diff
	fix-invisible-text.diff
	gui-insensitive_oog680_m2.diff
	ucb-no-CURL_NO_OLDIES_oog_m5.diff
	libxmlsec-system-nss_oog_m5.diff
	libxmlsec-findcerts_oog_m5.diff
	soffice-detect-mozilla-certificates_oog_m5.diff
	detect_db46_src233.diff
	#http://oooconv.free.fr/fontooo/FontOOo.sxw
	FontOOo_1.7.1.sxw # from http://www.openoffice.org/issues/show_bug.cgi?id=81102
	awt_x86_64.diff)
options=('!distcc' '!ccache' '!strip')
md5sums=('2d9cf56696059b3974788776aad1bcb8'
         'a6c68c66790983504346e00841ef96f5'
         '60ad3ec530bf7251e3cc809e154a9396'
         '72dba5b4cd94d4439e06f75769402c6f'
         'a728dcd463c1aa7ca5db75146377a0d1'
         '0faab33566196ddc9c405d68cf614663'
         '39e4c1b1e864b22ee4650b2bff44c695'
         '2c91ba49857c5131ab455dbff9eca324'
         'b6ff61803ac5b759f6b8c33afadbdc72'
         '939a58f5c516bfbe2d71a3f383b1cc98'
         '509697a7da6508ac9377b7750a57bfc4'
         '4c76c07e867d51c416ea258220a90a6a'
         '135f1b3c837435de504c84e4db9dc4f7'
         '7fadadecaf511bb118bc1b657192520a'
         'a8b96e9d0ce92a8f6690f277b1cfacc9'
         '4271702d6e9e912b663d3e2d9b8a17e8'
         'cd8ff2b60ee86f576a1e04bac8dcb51b'
         '1fc1ca5205730655eab2d2e119aa06fe'
         '83bb5e235c4e4062eed404829d760c14')

# see ftp://ftp.linux.cz/pub/localization/OpenOffice.org/devel/build/build for upstream build instructions

build() {
	# just to make sure that it will detect the desired JDK/JVM - we want gcc-gcj/ecj
	unset J2REDIR; unset J2SDKDIR; unset JAVA_HOME; unset CLASSPATH
	[ -z "${JAVA_HOME}" ] && . /etc/profile.d/java-gcj-compat.sh
	JAVAHOME=${JAVA_HOME}
	[ -z "${QTDIR}" ] && . /etc/profile.d/qt.sh
	[ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh
	[ -z "${MOZ_PLUGIN_PATH}" ] && . /etc/profile.d/mozilla-common.sh
#	[ -z "${JAVA_HOME}" ] && . /etc/profile.d/jdk.sh

	cd $startdir/src/${_OO_milestone}/

	# build fixes
	# gcj build fix to find our gcj libs paths
	patch -Np0 -i ../jvmfwk-gij-paths_src239.diff || return 1
	# fix build with internal xmlsec
	patch -Np0 -i ../libxmlsec-system-nss_oog_m5.diff || return 1
	# detect new db4.6
	patch -Np0 -i ../detect_db46_src233.diff || return 1

	# allows xmlsec to be able to read the format of the digital certificates.
	patch -Np0 -i ../libxmlsec-findcerts_oog_m5.diff || return 1
	# allows soffice to find the user's firefox profile so that it can read
	# his digital certificates. Nss stores digital certificates in your mozilla firefox profile. 
	patch -Np0 -i ../soffice-detect-mozilla-certificates_oog_m5.diff || return 1

	# important bugfixes
	# fix for invisible text with gcc 4.2 http://www.openoffice.org/issues/show_bug.cgi?id=78417
	patch -Np0 -i ../fix-invisible-text.diff || return 1

	# fix font hinting
	patch -Np0 -i ../fix-font-hinting_src237.diff || return 1
	# this heavily improves the looks of disabled icons in OpenOffice toolbar. 
	patch -Np0 -i ../gui-insensitive_oog680_m2.diff || return 1

	# remove the startup wizard
	patch -Np0 -i ../default-no-startup-wizard_oog680_m1.diff || return 1
	# enables the default system-file-picker in case we have that built
	patch -Np0 -i ../default-system-fpicker_oog680_m1.diff || return 1

	# add gstreamer support for play audio in presentations
	patch -Np0 -i ../gstreamer-support_src239.diff || return 1

	# arch related fixes & configure options
	if [ "$CARCH" = "i686" ]; then
	  EXTRAOPTS="--with-arch=x86 "
	  SMP=1
	fi

	if [ "$CARCH" = "x86_64" ]; then
	  EXTRAOPTS="--with-arch=x86_64"
	  SMP=6
          # fixes to build with SUN jdk/jre
          # http://qa.openoffice.org/issues/show_bug.cgi?id=74749
	 # sed -i "s:lib64\/libjpeg.so:lib\/libjpeg.so:g" $startdir/src/${_OO_milestone}/solenv/inc/libs.mk
          # http://qa.openoffice.org/issues/show_bug.cgi?id=74751
	 # patch -Np0 -i ../awt_x86_64.diff || return 1
	fi

	cd $startdir/src/${_OO_milestone}/config_office

	# Set OOO_VENDOR in build environment
	export OOO_VENDOR="ArchLinux"
	# export C(XX)FLAGS
	export ARCH_FLAGS="$CFLAGS"

	# Need to recreate the configure script because of patches
	autoconf || return 1

	./configure --with-build-version="${pkgver} ArchLinux build-${pkgrel} (${_OO_milestone})" \
	--prefix=/usr --exec-prefix=/usr\
	--with-binfilter\
	--disable-ldap\
	--with-lang="en-US"\
	--disable-gnome-vfs\
	--disable-mono\
	--disable-odk\
	--disable-qadevooo\
	--disable-systray\
	--disable-gpc\
	--enable-gtk\
	--enable-kde\
	--enable-cups\
	--enable-dbus\
	--enable-cairo\
	--enable-evolution2\
	--enable-crashdump\
	--enable-libsn\
	--enable-vba\
	--with-package-format=native\
	--with-system-db\
	--with-system-cairo\
	--with-system-curl\
	--with-system-expat\
	--with-system-fonts\
	--with-system-freetype\
	--with-system-hunspell\
	--with-system-jpeg\
	--with-system-libwpd\
	--with-system-libxml\
	--with-system-libxslt\
	--with-system-mozilla\
	--with-system-neon\
	--with-system-python\
	--with-system-sane-header\
	--with-system-sndfile\
	--with-system-stdlibs\
	--with-system-xrender-headers\
	--with-system-zlib\
	--with-system-openssl\
	--without-fonts\
	--without-myspell-dicts\
	--without-nas\
	--without-docdir\
	--without-afms\
	--without-myspell-dicts\
	--with-jdk-home=${JAVA_HOME} \
	--with-java-home=${JAVA_HOME} \
 	--with-system-hsqldb \
	--with-hsqldb-jar=/usr/share/java/hsqldb.jar \
	--with-system-xerces \
	--with-xerces-jar=/usr/share/java/xercesImpl.jar \
	--with-system-xalan \
	--with-xalan-jar=/usr/share/java/xalan.jar \
	--with-system-xml-apis\
	--with-xml-apis-jar=/usr/share/java/xml-apis.jar \
	--with-serializer-jar=/usr/share/java/serializer.jar \
	--with-use-shell=bash\
	 $EXTRAOPTS || return 1

#	--with-system-icu\

	cd ..

	# Setup environment for build
	if [ "$CARCH" = "x86_64" ]; then
	  source LinuxX86-64Env.Set.sh
	 else source LinuxX86Env.Set.sh
	fi

	# Build dmake utility
	./bootstrap || return 1

	# to compile with SMP add -P2 or above, remove any -Px if your cou has only one core or if you want to fix it for non smp build
	cd instsetoo_native
	build.pl -P${SMP} --all || return 1
	cd ..

	# install binaries
	if [ "$CARCH" = "x86_64" ]; then
	  cp -R instsetoo_native/unxlngx6.pro/OpenOffice/native/install/en-US/linux-2.6-x86_64/buildroot/* $startdir/pkg/
	 else 	cp -R instsetoo_native/unxlngi6.pro/OpenOffice/native/install/en-US/linux-2.6-intel/buildroot/* $startdir/pkg/
	fi

	cd $startdir/pkg/opt
	mv openoffice.org2.4 openoffice

	# replace original splash intro screen with one provided by shastry
	rm -rf $startdir/pkg/opt/openoffice/program/intro.bmp
	install -D -m644 $startdir/src/intro.bmp $startdir/pkg/opt/openoffice/program/

	# prepare filesystem entries
	mkdir -p $startdir/pkg/usr/{bin,share/applications}
	mkdir -p $startdir/pkg/usr/share/icons/{HighContrast,hicolor,locolor}

	# make symlinks
	cd $startdir/pkg/usr/bin
	ln -s ../../opt/openoffice/program/soffice soffice
	ln -s ../../opt/openoffice/program/spadmin spadmin

	# install shortcuts
	cp $startdir/pkg/opt/openoffice/share/xdg/*.desktop  $startdir/pkg/usr/share/applications
	cd $startdir/pkg/usr/share/applications
	sed -i -e 's|Exec=openoffice.org2.4|Exec=/opt/openoffice/program/soffice|g' *.desktop
	sed -i -e 's|Exec=/opt/openoffice/program/soffice-printeradmin|Exec=/opt/openoffice/program/spadmin|g' printeradmin.desktop
	# fix exec commands in shortcuts for Xfce menu
	sed -i -e 's|base %U|base|g' base.desktop
	sed -i -e 's|calc %U|calc|g' calc.desktop
	sed -i -e 's|draw %U|draw|g' draw.desktop
	sed -i -e 's|impress %U|impress|g' impress.desktop
	sed -i -e 's|math %U|math|g' math.desktop
	sed -i -e 's|writer %U|writer|g' writer.desktop
	# remove quickstarter, we disabled it above
	rm -rf $startdir/pkg/usr/share/applications/qstart.desktop
	# fix icons in shortcuts
	sed -i -e 's|Icon=openofficeorg23-|Icon=|g' *.desktop
	# add template desktop file
	install -D -m644 $startdir/src/template.desktop $startdir/pkg/usr/share/applications/template.desktop

	# install icons
	cd $startdir/src/${_OO_milestone}/sysui/desktop/icons
	cp -a -v HighContrast/*x* $startdir/pkg/usr/share/icons/HighContrast
	cp -a -v hicolor/*x* $startdir/pkg/usr/share/icons/hicolor
	cp -a -v locolor/*x* $startdir/pkg/usr/share/icons/locolor

	# just in case icon calc is used by calculator :)
	find $startdir/pkg/usr/share/icons -type d -name apps -exec mv {}/calc.png  {}/ooocalc.png \;
	sed -i -e 's|Icon=calc|Icon=ooocalc|g' $startdir/pkg/usr/share/applications/calc.desktop # already done above

	# fix ownership and permissions
	chown root.root -R $startdir/pkg/
	chmod +rX -R $startdir/pkg/usr

	# some cleanup
	find $startdir/pkg/usr/share/icons -depth -name "CVS" -type d -exec rm -r {} \; > /dev/null 2>&1
	rm -f $startdir/pkg/opt/openoffice/program/oo_product.bmp
	touch $startdir/pkg/opt/openoffice/share/dict/ooo/.directory
	touch $startdir/pkg/opt/openoffice/presets/template/.directory
	touch $startdir/pkg/opt/openoffice/share/extension/install/.directory
	rmdir $startdir/pkg/opt/openoffice/program/{addin,plugin}
	rmdir $startdir/pkg/opt/openoffice/presets/psprint/{driver,fontmetric}
	rmdir $startdir/pkg/opt/openoffice/presets/uno_packages/cache
	rmdir $startdir/pkg/opt/openoffice/presets/{autocorr,store,Scripts,wordbook,backup,temp,psprint,uno_packages}
	rm -rf $startdir/pkg/opt/openoffice/share/uno_packages
	# remove unecessary temp files if they exist 
	rm -f  $startdir/pkg/opt/openoffice/program/root*.dat
	rm -f  $startdir/pkg/opt/openoffice/program/root*.dat.*

	# fix font wizard not installed by default (from http://qa.openoffice.org/issues/show_bug.cgi?id=81102)
	install -D -m644 $startdir/src/FontOOo_1.7.1.sxw $startdir/pkg/opt/openoffice/share/dict/ooo/FontOOo.sxw

	# add missing spell wizard
	install -D -m644 $startdir/src/${_OO_milestone}/dictionaries/diclst/DicOOo.sxw $startdir/pkg/opt/openoffice/share/dict/ooo/DicOOo.sxw

	# link the mozilla-plugin
	mkdir -p $startdir/pkg/opt/mozilla/lib/plugins/
	cd $startdir/pkg/opt/mozilla/lib/plugins/
	ln -v -s ../../../openoffice/program/libnpsoplugin.so .

	## Develize it!
	cd $startdir/pkg/opt/
	mv openoffice openoffice-dev
	sed -i -e 's|Exec=/opt/openoffice/program|Exec=/opt/openoffice-dev/program|g' $startdir/pkg/usr/share/applications/*.desktop

	cd $startdir/pkg/usr/bin
	rm -f soffice spadmin
	ln -sf ../../opt/openoffice-dev/program/soffice soffice-dev
	ln -sf ../../opt/openoffice-dev/program/spadmin spadmin-dev
	cd $startdir/pkg/usr/share/applications/

	for desktopz in *.desktop
	   do mv $desktopz Dev-$desktopz
	done
	
	for i in `find $startdir/pkg/usr/share/icons -name '*.png'`  ; do  mv $i `dirname $i`/dev-`basename $i` ; done ;
	
	cd $startdir/pkg/usr/share/applications/
	sed -i -e 's|Icon=|Icon=dev-|g' $startdir/pkg/usr/share/applications/*.desktop
	sed -i -e 's|OpenOffice\.org\ 2\.3|OpenOffice\.org\ devel|g' $startdir/pkg/usr/share/applications/*.desktop
	sed -i -e 's|\/opt\/openoffice\-dev\/program\/soffice|\/usr\/bin\/soffice\-dev|g' $startdir/pkg/usr/share/applications/*.desktop

	mv $startdir/pkg/opt/openoffice-dev/program/soffice.bin $startdir/pkg/opt/openoffice-dev/program/soffice-dev.bin
	mv $startdir/pkg/opt/mozilla/lib/plugins/libnpsoplugin.so $startdir/pkg/opt/mozilla/lib/plugins/libnpsoplugin-dev.so
}
