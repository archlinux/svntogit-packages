--- camel/camel-sasl-gssapi.c.orig	2010-01-28 23:26:56.000000000 +0000
+++ camel/camel-sasl-gssapi.c	2010-01-28 23:32:28.000000000 +0000
@@ -31,7 +31,7 @@
 #include <string.h>
 #include <sys/socket.h>
 #include <sys/types.h>
-#include <krb5/krb5.h>
+#include <krb5.h>
 #ifdef HAVE_ET_COM_ERR_H
 #include <et/com_err.h>
 #else
