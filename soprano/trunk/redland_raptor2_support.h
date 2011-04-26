From: Luigi Toscano <luigi.toscano@tiscali.it>
Subject: Add support for raptor V2 to the redland backend
Acked-By: Modestas Vainius <modax@debian.org>
Forwarded: no
Origin: other
Last-Update: 2011-03-22

--- a/backends/redland/redlandbackend.cpp
+++ b/backends/redland/redlandbackend.cpp
@@ -24,6 +24,7 @@
 
 #include "redlandbackend.h"
 
+#include <raptor2/raptor.h>
 #include <redland.h>
 
 #include "redlandworld.h"
--- a/backends/redland/redlandmodel.h
+++ b/backends/redland/redlandmodel.h
@@ -28,6 +28,7 @@
 #include <QtCore/QtGlobal>
 #include <QtCore/QTextStream>
 
+#include <raptor2/raptor.h>
 #include <redland.h>
 
 #include "storagemodel.h"
--- a/backends/redland/redlandnodeiteratorbackend.h
+++ b/backends/redland/redlandnodeiteratorbackend.h
@@ -24,6 +24,7 @@
 
 #include "iteratorbackend.h"
 
+#include <raptor2/raptor.h>
 #include <redland.h>
 
 #include <QtCore/QSharedDataPointer>
--- a/backends/redland/redlandqueryresult.h
+++ b/backends/redland/redlandqueryresult.h
@@ -23,6 +23,7 @@
 #ifndef SOPRANO_BACKEND_REDLAND_QUERY_RESULT_H
 #define SOPRANO_BACKEND_REDLAND_QUERY_RESULT_H
 
+#include <raptor2/raptor.h>
 #include <redland.h>
 #include <QString>
 
--- a/backends/redland/redlandstatementiterator.h
+++ b/backends/redland/redlandstatementiterator.h
@@ -23,6 +23,7 @@
 #ifndef SOPRANO_BACKEND_REDLAND_STATEMENT_ITERATOR_H
 #define SOPRANO_BACKEND_REDLAND_STATEMENT_ITERATOR_H
 
+#include <raptor2/raptor.h>
 #include <redland.h>
 
 #include "iteratorbackend.h"
--- a/backends/redland/redlandworld.h
+++ b/backends/redland/redlandworld.h
@@ -23,6 +23,7 @@
 #ifndef SOPRANO_BACKEND_REDLAND_WORLD_H
 #define SOPRANO_BACKEND_REDLAND_WORLD_H
 
+#include <raptor2/raptor.h>
 #include <redland.h>
 
 #include "error.h"
