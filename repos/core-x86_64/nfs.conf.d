# Number of servers to be started up by default
NFSD_OPTS=8

# Options to pass to rpc.mountd
# e.g. MOUNTDOPTS="-p 32767"
MOUNTD_OPTS="--no-nfs-version 1 --no-nfs-version 2"

# Options to pass to rpc.statd
# N.B. statd normally runs on both client and server, and run-time
# options should be specified accordingly. Specifically, the Arch
# NFS init scripts require the --no-notify flag on the server,
# but not on the client e.g.
# STATD_OPTS="--no-notify -p 32765 -o 32766" -> server
# STATD_OPTS="-p 32765 -o 32766" -> client
STATD_OPTS=""

# Options to pass to sm-notify
# e.g. SMNOTIFY_OPTS="-p 32764"
SMNOTIFY_OPTS=""

