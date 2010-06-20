#!/bin/sh
GITSNAPSHOT=20100517
# aufs2 (no -xx) for the latest -rc version.
git clone http://git.c3sl.ufpr.br/pub/scm/aufs/aufs2-util.git aufs2-util.git
cd aufs2-util.git
#git checkout origin/aufs2${AUFS2VERSION}
git checkout 
cd ..
rm -rf aufs2-util-${GITSNAPSHOT}
cp -a aufs2-util.git aufs2-util-${GITSNAPSHOT}
tar -czf aufs2-util-${GITSNAPSHOT}.tar.gz --exclude=.git aufs2-util-${GITSNAPSHOT}
