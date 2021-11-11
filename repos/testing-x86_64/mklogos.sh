#!/bin/sh
set -e

baseurl=https://raw.githubusercontent.com/archlinux/archweb/44336237bcaadb07d01c1f83fb97a9dc56cda56d/public/static/logos/

mklogo() (
  name="$1"
  remote="$2"

  rm -f -- "$remote" "$name.svg.tmp" "$name.svg" "$name.png"
  wget -O "$remote" -- "$baseurl/$remote"
  rsvg-convert -f svg -h 256 -o "$name.svg.tmp" -- "$remote"
  scour --strip-xml-prolog --remove-descriptive-elements \
      --enable-comment-stripping --enable-viewboxing \
      --enable-id-stripping --shorten-ids \
      -i "$name.svg.tmp" -o "$name.svg"
  rsvg-convert -f png -z 1 -o "$name.png" -- "$name.svg"
  optipng -strip all -o4 -fix -- "$name.png"
  rm -- "$remote" "$name.svg.tmp"
)

mklogo archlinux-logo           archlinux-logo-only.svg           &
mklogo archlinux-logo-text      archlinux-logo-dark-scalable.svg  &
mklogo archlinux-logo-text-dark archlinux-logo-light-scalable.svg &

wait
