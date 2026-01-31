{ pkgs, ... }:

{
    # Better cat
    programs.bat = {
        enable = true;
        config.theme = "gruvbox-dark";
        config.style = "numbers";
    };

    # Better cd
    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };

    # Better find
    programs.fd = {
        enable = true;
        hidden = true;
        extraOptions = [ "--color=always" ];
    };

    # eza
    programs.eza = {
        enable = true;
        enableZshIntegration = false;
        icons = "always"; # Always show icons
        extraOptions = [
            "--git"
            "--git-ignore"
            "--group-directories-first"
            "--header"
        ];
    };

    # fzf integration
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };

    # Nix output monitor
    programs.nix-your-shell = {
        enable = true;
        enableZshIntegration = true;
        nix-output-monitor.enable = true;
    };

    # Ripgrep
    programs.ripgrep = {
        enable = true;
        arguments = [ "--hidden" "--glob" "!.git/*" ];
    };
}
