{
  lib,
  config,
  ...
}:
{
  imports = [
    ./base16.nix
    ./catppuccin.nix
    ./rose-pine.nix
  ];

  options = {
    colorschemes.enable = lib.mkEnableOption "Enable colorschemes module";
  };
  config = lib.mkIf config.colorschemes.enable {
    base16.enable = lib.mkDefault true;
    catppuccin.enable = lib.mkDefault false;
    rose-pine.enable = lib.mkDefault false;
  };
}
