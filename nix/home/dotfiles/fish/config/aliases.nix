{ ... }:

{
  programs.fish.shellAliases = {
    cat = "bat";
    cd = "z";
    fzf = "fzf --preview 'bat --color=always --style=plain {}' --bind 'enter:execute(nvim -- {})'";
    ls = "eza";
    yazi = "yy";
    zlj = "zellij";
  };
}
