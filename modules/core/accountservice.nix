{ pkgs, vars, ... }:
{
  services.accounts-daemon.enable = true;

  system.activationScripts.accountsServiceIcon = {
    text = ''
            # Ensure the icons directory exists
            ${pkgs.coreutils}/bin/mkdir -p /var/lib/AccountsService/icons
            
            # Copy user icon from home to AccountsService icons
            if [ -f /home/${vars.username}/.face ]; then
              ${pkgs.coreutils}/bin/cp -f /home/${vars.username}/.face /var/lib/AccountsService/icons/${vars.username}
              ${pkgs.coreutils}/bin/chmod 644 /var/lib/AccountsService/icons/${vars.username}
            fi

            # Ensure the users directory exists
            ${pkgs.coreutils}/bin/mkdir -p /var/lib/AccountsService/users
            
            # Create AccountsService user config if it doesn't exist or update Icon
            USER_FILE="/var/lib/AccountsService/users/${vars.username}"
            if [ ! -f "$USER_FILE" ]; then
              ${pkgs.coreutils}/bin/cat <<EOF > "$USER_FILE"
      [User]
      Icon=/var/lib/AccountsService/icons/${vars.username}
      SystemAccount=false
      EOF
            else
              # If file exists, ensure Icon is set correctly
              if ${pkgs.gnugrep}/bin/grep -q "^Icon=" "$USER_FILE"; then
                ${pkgs.gnused}/bin/sed -i "s|^Icon=.*|Icon=/var/lib/AccountsService/icons/${vars.username}|" "$USER_FILE"
              else
                ${pkgs.coreutils}/bin/echo "Icon=/var/lib/AccountsService/icons/${vars.username}" >> "$USER_FILE"
              fi
            fi
            ${pkgs.coreutils}/bin/chmod 600 "$USER_FILE"
    '';
  };
}
