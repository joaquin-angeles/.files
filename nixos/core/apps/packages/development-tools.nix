{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        autoconf
        automake
        binutils
        bison
        cmake
        debugedit
        fakeroot
        file
        findutils
        flex
        gawk
        gcc
        gettext
        git
        gnugrep
        gnumake
        gnused
        groff
        gzip
        libtool
        m4
        patch
        pkg-config
        texinfo
        wget
        which
    ];
}
