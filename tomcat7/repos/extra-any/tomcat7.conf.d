# Configuration file for Tomcat 7
# Have a look at /usr/share/tomcat7/bin/catalina.sh for a complete list of environment variables

# The JAVA_HOME of the JVM for Tomcat to use
# (compulsory to enable tomcat to start at boot)
TOMCAT_JAVA_HOME=/usr/lib/jvm/java-7-openjdk

# Tomcat home directory
CATALINA_HOME=/usr/share/tomcat7

# In many circumstances, it is desirable to have a single copy of a Tomcat
# binary distribution shared among multiple users on the same server.  To make
# this possible, you can set the $CATALINA_BASE environment variable to the
# directory that contains the files for your 'personal' Tomcat instance.
CATALINA_BASE=/usr/share/tomcat7

# Tomcat additional commandline options
CATALINA_OPTS=
