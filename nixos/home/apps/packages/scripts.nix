{ config, lib, ... }:

let
    scriptsDir = "./scripts";
    scriptEntries = lib.mapAttrs' (name: _: 
        lib.nameValuePair ".local/bin/${name}" { source = "${scriptsDir}/${name}"; }
    ) (builtins.readDir scriptsDir);
in
    {
    home.file = scriptEntries;
}
