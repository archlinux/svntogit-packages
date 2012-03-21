#!/bin/bash

## For actual repos

# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/lua lua
# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/gpxe gpxe
# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/ntldr-img ntldr-img
# bzr branch bzr://bzr.savannah.gnu.org/grub-extras/915resolution 915resolution

## For launchpad mirror

# bzr branch lp:~the-ridikulus-rat/grub/grub2-extras-lua lua
# bzr branch lp:~the-ridikulus-rat/grub/grub2-extras-gpxe gpxe
# bzr branch lp:~the-ridikulus-rat/grub/grub2-extras-ntldr-img ntldr-img
# bzr branch lp:~the-ridikulus-rat/grub/grub2-extras-915resolution 915resolution

## grub-extras zfs is integrated into grub2 bzr main repo and is no longer needed separately.

_WD="${PWD}/"
_OUTPUT_DIR="${_WD}/"

_ACTUAL_PKGVER="1.99"

_GRUB2_BZR_REPO_DIR="${_WD}/grub2_BZR/"
_GRUB2_BZR_EXP_REPO_DIR="${_WD}/grub2_experimental_BZR/"
_GRUB2_EXTRAS_REPOS_DIR="${_WD}/grub2_extras_BZR/"

_MAIN_SNAPSHOT() {
	
	cd "${_GRUB2_BZR_REPO_DIR}/"
	echo
	
	_REVNUM="$(bzr revno ${_GRUB2_BZR_REPO_DIR})"
	bzr export --root="grub-${_ACTUAL_PKGVER}" --format="tar" "${_OUTPUT_DIR}/grub2_r${_REVNUM}.tar"
	echo
	
	cd "${_OUTPUT_DIR}/"
	
	xz -9 "${_OUTPUT_DIR}/grub2_r${_REVNUM}.tar"
	echo
	
}

_EXP_SNAPSHOT() {
	
	cd "${_GRUB2_BZR_EXP_REPO_DIR}/"
	echo
	
	_REVNUM="$(bzr revno ${_GRUB2_BZR_EXP_REPO_DIR})"
	bzr export --root="grub-${_ACTUAL_PKGVER}" --format="tar" "${_OUTPUT_DIR}/grub2_exp_r${_REVNUM}.tar"
	echo
	
	cd "${_OUTPUT_DIR}/"
	
	xz -9 "${_OUTPUT_DIR}/grub2_exp_r${_REVNUM}.tar"
	echo
	
}

_EXTRAS_SNAPSHOT() {
	
	cd "${_GRUB2_EXTRAS_REPOS_DIR}/${_GRUB2_EXTRAS_NAME}/"
	echo
	
	_REVNUM="$(bzr revno ${_GRUB2_EXTRAS_REPOS_DIR}/${_GRUB2_EXTRAS_NAME})"
	bzr export --root="${_GRUB2_EXTRAS_NAME}" --format=tar "${_OUTPUT_DIR}/grub2_extras_${_GRUB2_EXTRAS_NAME}_r${_REVNUM}.tar"
	echo
	
	cd "${_OUTPUT_DIR}/"
	echo
	
	xz -9 "${_OUTPUT_DIR}/grub2_extras_${_GRUB2_EXTRAS_NAME}_r${_REVNUM}.tar"
	echo
	
}

echo

set -x -e

echo

_MAIN_SNAPSHOT

echo

# _EXP_SNAPSHOT

echo

_GRUB2_EXTRAS_NAME="lua"
_EXTRAS_SNAPSHOT

_GRUB2_EXTRAS_NAME="gpxe"
_EXTRAS_SNAPSHOT

_GRUB2_EXTRAS_NAME="ntldr-img"
_EXTRAS_SNAPSHOT

_GRUB2_EXTRAS_NAME="915resolution"
_EXTRAS_SNAPSHOT

echo

set +x +e

echo

unset _WD
unset _OUTPUT_DIR
unset _GRUB2_BZR_REPO_DIR
unset _GRUB2_EXTRAS_REPOS_DIR
unset _GRUB2_EXTRAS_NAME
