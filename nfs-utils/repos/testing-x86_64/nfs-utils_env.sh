#!/bin/bash
# archlinux config files
. /etc/conf.d/nfs-common.conf
. /etc/conf.d/nfs-server.conf
# config file read by systemd files
NFS_UTILS_CONFIG=/run/sysconfig/nfs-utils

[[ -d /run/sysconfig ]] || mkdir /run/sysconfig
[[ -e  $NFS_UTILS_CONFIG ]] && rm -f $NFS_UTILS_CONFIG

# /etc/conf.d/nfs-common
echo "STATDARGS=\"$STATD_OPTS\"" >> $NFS_UTILS_CONFIG
echo "SMNOTIFYARGS=\"$SMNOTIFY_OPTS\"" >> $NFS_UTILS_CONFIG
echo "RPCIDMAPDARGS=\"$IDMAPD_OPTS\"" >> $NFS_UTILS_CONFIG
echo "GSSDARGS=\"$GSSD_OPTS\"" >> $NFS_UTILS_CONFIG

# /etc/conf.d/nfs-server
echo "RPCMOUNTDARGS=\"$MOUNTD_OPTS\"" >> $NFS_UTILS_CONFIG
echo "RPCNFSDARGS=\"$NFSD_OPTS\"" >> $NFS_UTILS_CONFIG
echo "SVCGSSDARGS=\"$SVCGSSD_OPTS\"" >> $NFS_UTILS_CONFIG