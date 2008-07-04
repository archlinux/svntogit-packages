export J2REDIR=/opt/java/jre
export PATH=$PATH:$J2REDIR/bin
export CLASSPATH=$CLASSPATH:$J2REDIR/lib
if [ ! -f /etc/profile.d/jdk.sh ]; then
        export JAVA_HOME=/opt/java/jre
fi
