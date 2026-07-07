{
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 100;
    memoryPercent = 60;
  };

  # tuned for zram-primary swap: prefer fast RAM-compressed swap over disk,
  # skip readahead clustering (pointless when swap is RAM, not spinning disk)
  boot.kernel.sysctl = {
    "vm.swappiness" = 150;
    "vm.page-cluster" = 0;
  };
}
