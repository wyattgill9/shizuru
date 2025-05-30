{
  config,
  pkgs,
  pkgs-master,
  inputs,
  options,
  lib,
  system,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.catppuccin.homeModules.catppuccin
  ];
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.bottom = {
    enable = true;
  };
  programs.zellij = {
    enable = true;
  };
  programs.gh = {
    enable = true;
    package = pkgs.gh;
  };
  programs.btop = {
    enable = true;
  };
  programs.imv = {
    enable = true;
  };
  programs.htop = {
    enable = true;
  };

  catppuccin.enable = true;
  catppuccin.mako.enable = false;
  # catppuccin.cursors = {
  #     enable = true;
  #     accent = "green";
  #     flavor = "mocha";
  # };
  services.arrpc.enable = true;
  home.file = {
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    VISUAL = "codium";
    BROWSER = "firefox";
  };
  
 systemd.user.services.walker = {
     Unit = {
       Description = "walker gapplication services";
	   After = "graphical-session.target";
	   PartOf = "graphical-session.target";
     };
     Install.WantedBy = [ "graphical-session.target" ];
     Service = {
         Type = "simple";
         ExecStart = "${inputs.walker.packages.${pkgs.system}.default}/bin/walker --gapplication-service";
         Restart = "always";
     };
 }; 
  #home.backupFileExtension = "bkp";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
