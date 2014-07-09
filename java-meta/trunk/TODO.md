The idea would be to be able to use `pacman -S java-runtime-headless-meta` as a kind of *fix* to Archers problem with JDKs

Find list of jdk installed
  (by looking at /usr/lib/jvm directories – very important because packages can provide java-runtime but not be in this dir. It is assumed that package that put files in these dirs do comply to the meta super package thing)
  if there are more than one jdk installed let user know and give him usage for changing this

# meta

## When installing java-runtime-headless-meta

- link 'default' does not exist
  - no jdk is installed
    - do not say a word, we might just be installing for the first time
    - let this case be handled by next JDK to be installed?
  - one jdk is installed
    - link to that jdk and let user know
  - multiple jdk are installed
    - if one is the official AL one then link it and let user know
    - give usage to user

- link 'default' exists
  - no jdk is installed
    - remove link and let user know
  - one jdk is installed
    - check/fix link points at this jdk and let user know
  - multiple jdk are installed
    - check link points at a valid jdk and let user know if trouble

## When removing java-runtime-headless-meta

- remove 'default' link
  - do not test if any other jdk is installed or warn user (he should have already been warned by pacman)


# JDK

## When installing a JDK

- link 'default' does not exist
  - this jdk is the only one installed
    - link to this jdk
  - at least one other jdk is installed
    - ling to this jdk
    - give usage to user

- link 'default' exists
  - this jdk is the only one installed
    - check link points at this jdk
  - at least one other jdk is installed
    - check link points at a valid jdk and let user know if trouble

## When removing a JDK

- give user usage


# usage

- list installed jdk
- give `ln` example command
