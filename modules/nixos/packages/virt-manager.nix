{ meta, pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      # swtpm.enable = true; # Windows-specific: TPM 2.0 emulation
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    # win-virtio # Windows-specific: Drivers
    # win-spice  # Windows-specific: Agent
  ];

  services.spice-vdagentd.enable = true;

  networking.firewall.checkReversePath = false;

  users.users."${meta.user}".extraGroups = [ "libvirtd" "kvm" ];
}