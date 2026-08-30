{ config, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = with config.lib.stylix.colors; {
      add_newline = false;

      format = "[┌──\\[](fg:#${base07})$username$hostname[\\]──\\[](fg:#${base07})$directory[\\]](fg:#${base07})$rust$golang$python$nodejs$java$kotlin$lua$nix_shell$git_branch$git_status\n[└──](fg:#${base07})$character";

      git_branch = {
        format = "[──\\[](fg:#${base07})[$symbol$branch]($style)[$ahead_behind](fg:#${base09})[\\]](fg:#${base07})";
        style = "fg:#${base0E}";
      };

      git_status = {
        format = "";
      };

      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "bold #${base0D}";
      };

      hostname = {
        ssh_only = false;
        format = "[@$hostname]($style)";
        style = "bold #${base0D}";
      };

      directory = {
        format = "[$path]($style)";
        style = "fg:#${base0B}";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      rust = {
        format = "[$symbol$version]($style) ";
        style = "fg:#${base09}";
      };

      golang = {
        format = "[$symbol$version]($style) ";
        style = "fg:#${base0C}";
      };

      python = {
        format = "[$symbol$version]($style) ";
        style = "fg:#${base0A}";
      };

      nodejs = {
        format = "[$symbol$version]($style) ";
        style = "fg:#${base0B}";
      };

      java = {
        format = "[$symbol$version]($style) ";
        style = "fg:#${base08}";
      };

      kotlin = {
        format = "[$symbol$version]($style) ";
        style = "fg:#${base0E}";
      };

      lua = {
        format = "[$symbol$version]($style) ";
        style = "fg:#${base0D}";
      };

      nix_shell = {
        format = "[$symbol$name]($style) ";
        style = "fg:#${base0D}";
      };

      character = {
        success_symbol = "[](bold fg:#${base0B})";
        error_symbol = "[](bold fg:#${base08})";
      };
    };
  };
}
