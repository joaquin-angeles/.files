{ ... }:

{
  programs.zsh.shellAliases = {
    cat = "bat";
    cd = "z";
    ff = "fzf --preview 'bat --color=always --style=plain {}' --bind 'enter:execute(nvim -- {})'";
    ls = "eza";
    yazi = "yy";
    zlj = "zellij";
  };
}
