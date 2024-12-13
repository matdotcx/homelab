{
  description = "My Homelab";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            allowUnsupportedSystem = true;
          };
        };
        
        # Platform-specific packages
        platformSpecificPackages = if pkgs.stdenv.isDarwin then [
          pkgs.coreutils
          pkgs.gnused
        ] else [
          pkgs.iproute2
          pkgs.iputils
          pkgs.libisoburn
          pkgs.neovim
          pkgs.openssh
          pkgs.p7zip
          pkgs.qrencode
          pkgs.shellcheck
          pkgs.wireguard-tools
          pkgs.yamllint
        ];

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Core tools that work on both platforms
            ansible
            age
            argocd
            docker
            fluxcd
            git
            gnumake
            go
            gopls
            helm
            jq
            k9s
            kind
            kubectl
            kubernetes-helm
            kustomize
            opentofu # Drop-in replacement for Terraform
            pre-commit
            sops
            stern
            terraform
            yq-go
          ] ++ platformSpecificPackages;

          shellHook = ''
            echo "Homelab development environment"
            echo "Running on: ${system}"
          '';
        };
      }
    );
}
