{ config, lib, ... }:

let
  scriptsDir = "${config.home.homeDirectory}/.files/bash";
  scriptEntries = lib.mapAttrs' (
    name: _: lib.nameValuePair ".local/bin/${name}" { source = "${scriptsDir}/${name}"; }
  ) (builtins.readDir scriptsDir);
in
{
  home.file = scriptEntries;
}
