#include <unistd.h>
#define REAL_PATH "/opt/kde/bin/fileshareset.pl"
int main(ac, av)
char **av;
	{
		execv(REAL_PATH, av);
		return 1;
	}
