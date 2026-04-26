{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    autoconf
    automake
    binutils
    bison
    elfutils
    fakeroot
    file
    flex
    gcc
    gettext
    groff
    libtool
    m4
    gnumake
    patch
    pkg-config
    texinfo
  ];
}
