{ config, lib, pkgs, ... }:

{
  imports = [];

  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;  
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
     enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Enable flakes support 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.powerm1nt = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ];
     packages = with pkgs; [
       firefox
       vesktop
       spotify
       vscode
       spicetify-cli
       gnome.gnome-tweaks
     ];
  };

   environment.systemPackages = with pkgs; [
    neovim
    wget
    nano
    git
    fastfetch
    unzip
   ];

  system.stateVersion = "24.05";
}

