{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  # Pipewire fixes
  services.pipewire.extraConfig.pipewire-pulse."99-custom.conf" = {
    "pulse.cmd" = [
      {
        cmd = "load-module";
        args = "module-null-sink sink_name=virtual_sink sink_properties=device.description=\"Virtual_Stereo\"";
        flags = [ ];
      }
      {
        cmd = "load-module";
        args = "module-loopback source=virtual_sink.monitor sink=alsa_output.pci-0000_07_00.6.analog-stereo";
        flags = [ ];
      }
      {
        cmd = "load-module";
        args = "module-remap-source master=alsa_input.pci-0000_07_00.6.analog-stereo source_name=MICROPHONE source_properties=device.description=MICROPHONE";
        flags = [ ];
      }
    ];
  };

  # TPM2 disable
  systemd.tpm2.enable = false;
  boot.initrd.systemd.tpm2.enable = false;
}
