{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--color 16"
      "--layout reverse"
      "--preview-window right:50%:sharp"
      "--prompt '❯ '"
    ];

    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = [
      "--preview 'bat --color always {}'"
    ];

    changeDirWidgetOptions = [
      "--preview 'eza -T -L 3 --git-ignore --icons always --color always {}'"
    ];
  };
}
