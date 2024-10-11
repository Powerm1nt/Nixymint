{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./configuration.nix
      ./home_manager.nix
    ];
}

