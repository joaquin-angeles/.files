{ pkgs, ... }:

{
    # Find
    programs.fd = {
        enable = true;
        hidden = true;
        extraOptions = [ "--color=always" ];
    };

    # fzf integration
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
}
