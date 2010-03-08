# the external logic for pulling in patches

get_patches() {

  curl ftp://ftp.vim.org/pub/vim/patches/${_srcver}/MD5SUMS | sed -e \
    '/.gz$/d' > MD5SUMS
  let _patchlevel=$_patchlevel+1
  _currpatch=$(cat MD5SUMS | wc -l)
  sed -i "${_patchlevel},\$d" MD5SUMS
  rsync -avzcP "ftp.nluug.nl::Vim/patches/${_srcver}/${_srcver}.*" .
  md5sum -c MD5SUMS > /dev/null || return 1
  > vim.full.patch.log
  for file in $(cat MD5SUMS | awk '{ print $2 }')
    do patch -d ${_versiondir} -p0 < $file >> vim.full.patch.log || return 1; done

  ########

  if [ ${_patchlevel} -le ${_currpatch} ]; then
    echo ""
    echo -e "\t\tWARNING!"
    echo "You are not building the latest available version! A newer patchlevel"
    echo "seems to be available. Please edit the PKGBUILD and add the latest"
    echo "${_currpatch} as pkgrel number!"
    echo ""
    sleep 10
  fi
  return 0
}
