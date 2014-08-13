diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index 9de23a2..06a9ee6 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -1097,6 +1097,7 @@ void sctp_assoc_update(struct sctp_association *asoc,
 	asoc->c = new->c;
 	asoc->peer.rwnd = new->peer.rwnd;
 	asoc->peer.sack_needed = new->peer.sack_needed;
+	asoc->peer.auth_capable = new->peer.auth_capable;
 	asoc->peer.i = new->peer.i;
 	sctp_tsnmap_init(&asoc->peer.tsn_map, SCTP_TSN_MAP_INITIAL,
 			 asoc->peer.i.initial_tsn, GFP_ATOMIC);
