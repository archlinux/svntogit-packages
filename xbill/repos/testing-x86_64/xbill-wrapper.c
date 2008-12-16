/* Written by Menno E. Duursma for use with xbill */

/*
 * This program is free software. It comes without any warranty.
 * Granted WTFPL, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details.
 */

/*
 * Per default xbill sets its score file world writable
 * which obviously allows cheating ones hi-score :-(
 * Probably this came about since GTK+ doesn't allow setgid?
 * 
 * In the install-script we move xbill to xbill-bin and install
 * this here wrapper thing as xbill, with setuid and video group
 * executable filesystem perms. Here we change groups to games.
 *
 * We should now be able make /var/xbill group-writable only...
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <grp.h>

int main(int argc, char *argv[], char *envp[])
{

	/*
         * hardcoded path/program to exec
	 * and group to run under
	 */
        char prog[] = "/usr/bin/xbill-bin";
	char grpname[] = "games";

	struct group *grp;
	errno = 0;

	/* get our gid */
	grp = getgrnam(grpname);
	if (grp == NULL) {
		fprintf(stderr, "Error: getgrnam(%s) - %s\n",
			grpname,
			strerror(errno));
		exit(EXIT_FAILURE);
	}

	/* drop to the gid */
	if (setgid(grp->gr_gid)) {
		fprintf(stderr, "Error: setgid(%d) - %s\n",
			grp->gr_gid,
			strerror(errno));
		exit(EXIT_FAILURE);
	}
		

        /* drop back to calling uid */
	if (setuid(getuid())) {
		fprintf(stderr, "Error: setuid(%d) - %s\n",
			getuid(),
			strerror(errno));
		exit(EXIT_FAILURE);
		}

        /* tell the viewers wat is going to happen */
        fprintf(stderr, "Starting %s with uid = %d, gid = %d\n",
		prog,
		getuid(),
		getgid());

	/* fire it up */
	if (execve(prog, argv, envp) == -1) {
		fprintf(stderr, "Error: execve(%s, argv, envp) - %s\n",
			prog,
			strerror(errno));
		exit(EXIT_FAILURE);
	}

	return EXIT_SUCCESS;
}
