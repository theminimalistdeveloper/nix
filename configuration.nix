{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Include the results of the hardware scan.
  imports = [
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_11;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "central"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

# Greeter
  services.greetd = {
      enable = true;
      settings = {
          default_session = {
              command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
              user = "greeter";
          };
      };
  };

  services.flatpak.enable = true;

  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.n3xu5 = {
    isNormalUser = true;
    description = "n3xu5";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # DAW
    bitwig-studio
    # controls the brightness with the special keys
    brightnessctl
    # to use node applications as a workaround
    nodejs
    # for audio management
    pulseaudio
    python3
    # computer remote access software
    rustdesk
    vim
    # notification system developed by swaym creator
    mako
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
    hack-font
  ];

  programs.dconf.enable = true;
  programs.firefox.enable = true;
  programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
  };
  programs.zsh.enable = true;
  programs.steam.enable = true;

  system.stateVersion = "24.05";
}

