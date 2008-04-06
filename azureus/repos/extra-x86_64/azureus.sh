#!/bin/bash
CLASSPATH="/usr/share/java/Azureus2.jar:/usr/share/java/swt.jar:/usr/share/java/bcprov.jar"
java -cp "${CLASSPATH}" -Dazureus.install.path=${HOME}/.azureus/ org.gudy.azureus2.ui.swt.Main "$@"
