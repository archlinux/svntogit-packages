# Set path to perl scripts.

# Remove the perlbin dirs in the next release.
scriptdirs="/usr/lib/perl5/site_perl/bin /usr/bin/perlbin/site
/usr/lib/perl5/vendor_perl/bin /usr/bin/perlbin/vendor
/usr/lib/perl5/core_perl/bin /usr/bin/perlbin/core"

# Add dirs to path if they exist.
for currdir in ${scriptdirs}; do
	[ -d ${currdir} ] && perlpaths=${perlpaths}:${currdir}
done
export PATH=${PATH}:$perlpaths

