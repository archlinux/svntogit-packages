# Tomcat home directory
CATALINA_HOME=/usr/share/tomcat7

# In many circumstances, it is desirable to have a single copy of a Tomcat
# binary distribution shared among multiple users on the same server.  To make
# this possible, you can set the $CATALINA_BASE environment variable to the
# directory that contains the files for your 'personal' Tomcat instance.
CATALINA_BASE=${CATALINA_HOME}

# Tomcat additional commandline options
CATALINA_OPTS=
