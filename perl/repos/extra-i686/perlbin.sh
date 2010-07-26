# Set path to perl scripts.
# Remove the perlbin dirs in the next release.

# Add dirs to path if they exist.
[ -d /usr/lib/perl5/site_perl/bin ] &&
		PATH=$PATH:/usr/lib/perl5/site_perl/bin
[ -d /usr/bin/perlbin/site ] &&
		PATH=$PATH:/usr/bin/perlbin/site
[ -d /usr/lib/perl5/vendor_perl/bin ] &&
		PATH=$PATH:/usr/lib/perl5/vendor_perl/bin
[ -d /usr/bin/perlbin/vendor ] &&
		PATH=$PATH:/usr/bin/perlbin/vendor
[ -d /usr/lib/perl5/core_perl/bin ] &&
		PATH=$PATH:/usr/lib/perl5/core_perl/bin
export PATH

# If you have modules in non-standard directories you can add them here.
#export PERLLIB=dir1:dir2

