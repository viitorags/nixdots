{ pkgs, ... }:
{
  programs.rclone.enable = true;

  # O Serviço que executa a sincronização de fato
  systemd.user.services.rclone-obsidian-bisync = {
    Unit = {
      Description = "Bidirectional sync for Brain folder with Google Drive";
      After = [ "network-online.target" ];
    };

    Service = {
      Type = "oneshot";
      # Removemos os buffers de stream e focamos em sincronização estática
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone bisync Brain:Brain %h/Workspace/Brain \
          --create-empty-src-dirs \
          --compare size,modtime \
          --slow-hash-sync-only \
          --verbose
      '';
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/Workspace/Brain";
    };
  };

  # O Timer que dispara o serviço silenciosamente no background
  systemd.user.timers.rclone-obsidian-bisync = {
    Unit = {
      Description = "Timer to sync Brain folder every 5 minutes";
    };
    Timer = {
      OnBootSec = "3m"; # Aguarda 3 minutos após o boot para iniciar
      OnUnitActiveSec = "5m"; # Roda a cada 5 minutos
      Persistent = true; # Se o PC estava desligado na hora do timer, roda assim que ligar
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
