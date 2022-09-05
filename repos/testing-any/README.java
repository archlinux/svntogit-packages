This directory /etc/ssl/certs/java/ contains CA certificate bundle
files which are automatically created based on the information found in the
/usr/share/ca-certificates/trust-source/ and /etc/ca-certificates/trust-source/
directories.

All files are in the java keystore file format.

If your application isn't able to load the PKCS#11 module p11-kit-trust.so,
then you can use these files in your application to load a list of global
root CA certificates.

Please never manually edit the files stored in this directory,
because your changes will be lost and the files automatically overwritten,
each time the update-ca-trust command gets executed.

Please refer to the update-ca-trust(8) manual page for additional information.
