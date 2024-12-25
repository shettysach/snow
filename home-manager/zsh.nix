{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    # syntaxHighlighting.enable = true;
    # autosuggestion.enable = true;

    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }

      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    shellAliases = {
      nv = "nvim";
      fzfh = "fd -H . | fzf";
      fzfp = "fzf --preview 'bat --color=always {}'";
    };

    localVariables = {
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND = "";
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND = "";

      ZVM_VI_HIGHLIGHT_BACKGROUND = "magenta";
      ZVM_VI_EDITOR = "nvim";
      ZVM_INIT_MODE = "sourcing";
    };

    initExtra = ''
      function zvm_after_init() {
          bindkey '^R' fzf-history-widget
          bindkey '^P' history-substring-search-up
          bindkey '^N' history-substring-search-down
      }

      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color always --icon always $realpath'
      zstyle ':fzf-tab:*' switch-group '<' '>'
    '';

    history.size = 1000;
  };

}
