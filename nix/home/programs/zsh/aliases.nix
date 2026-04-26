{ ... }:

{
  programs.zsh.shellAliases = {
    cat = "bat";
    cd = "z";
    fzf = "fzf --preview 'bat --color=always --style=plain {}' --bind 'enter:execute(nvim -- {})'";
    lf = "lfcd";
    ls = "eza";
    yazi = "yy";
    zlj = "zellij";
  };
}
