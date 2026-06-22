let
  vitor = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqZBKKbF5Q1+a6xDfwRbtmNYSojS4wJ30KplklOzKGg vitor@gh0stk";
  gh0stk = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILJkDzuKgbHg4BXVIKeQxavxf4iFdhrDPqwaz8RjdVN9 root@gh0stk";
in
{
  "id_ed25519_github.age".publicKeys = [
    vitor
    gh0stk
  ];
  # "gpg_private.age".publicKeys = [
  #   vitor
  #   gh0stk
  # ];
}
