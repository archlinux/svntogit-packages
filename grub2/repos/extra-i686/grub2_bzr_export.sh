#!/bin/sh

## For actual repos

# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/lua lua
# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/gpxe gpxe
# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/ntldr-img ntldr-img
# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/915resolution 915resolution

## For launchpad mirror

# bzr branch lp:~skodabenz/grub/grub2-extras-lua lua
# bzr branch lp:~skodabenz/grub/grub2-extras-gpxe gpxe
# bzr branch lp:~skodabenz/grub/grub2-extras-ntldr-img ntldr-img
# bzr branch lp:~skodabenz/grub/grub2-extras-915resolution 915resolution

## grub-extras zfs is integrated into grub2 bzr main repo and is no longer needed separately.

wd=${PWD}/
output_dir=${wd}/

grub2_bzr_dir=${wd}/grub2_BZR/
grub2_bzr_exp_dir=${wd}/grub2_experimental_BZR/
grub2_extras_dir=${wd}/grub2_extras_BZR/

main_snapshot() {
	
	cd ${grub2_bzr_dir}/
	echo
	
	revnum=$(bzr revno ${grub2_bzr_dir})
	bzr export --root=grub2 --format=tar ${output_dir}/grub2_r${revnum}.tar
	echo
	
	cd ${output_dir}/
	
	xz -9 ${output_dir}/grub2_r${revnum}.tar
	echo
	
}

exp_snapshot() {
	
	cd ${grub2_bzr_exp_dir}/
	echo
	
	revnum=$(bzr revno ${grub2_bzr_exp_dir})
	bzr export --root=grub2_exp --format=tar ${output_dir}/grub2_exp_r${revnum}.tar
	echo
	
	cd ${output_dir}/
	
	xz -9 ${output_dir}/grub2_exp_r${revnum}.tar
	echo
	
}

extras_snapshot() {
	
	cd ${grub2_extras_dir}/${grub2_extras_name}/
	echo
	
	revnum=$(bzr revno ${grub2_extras_dir}/${grub2_extras_name})
	bzr export --root=${grub2_extras_name} --format=tar ${output_dir}/grub2_extras_${grub2_extras_name}_r${revnum}.tar
	echo
	
	cd ${output_dir}/
	echo
	
	xz -9 ${output_dir}/grub2_extras_${grub2_extras_name}_r${revnum}.tar
	echo
	
}

echo

set -x -e

# main_snapshot

# exp_snapshot

grub2_extras_name="lua"
extras_snapshot

grub2_extras_name="gpxe"
extras_snapshot

grub2_extras_name="ntldr-img"
extras_snapshot

grub2_extras_name="915resolution"
extras_snapshot

set +x +e

echo

unset wd
unset output_dir
unset grub2_bzr_dir
unset grub2_extras_dir
unset grub2_extras_name
