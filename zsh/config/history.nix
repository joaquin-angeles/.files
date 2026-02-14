{ pkgs, ... }:

{
    # Base zsh configuration
    programs.zsh.history = {
        size = 5000; # HISTSIZE
        save = 5000;
        share = true;
        ignoreSpace = true; # Ignore commands that start with a space
        extended = true;
        ignorePatterns = [ "ls *" "cd *" "pwd *" ]; # Ignore frequent/redundant commands

        # Ignore duplicate commands
        ignoreDups = true;
        ignoreAllDups = true;
        saveNoDups = true;
        expireDuplicatesFirst = true;
    };
}
