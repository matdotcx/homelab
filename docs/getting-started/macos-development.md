# macOS Development Setup

This guide covers setting up the homelab development environment on macOS.

## Overview

The homelab project has been adapted to work on macOS through Nix flakes, providing a reproducible development environment with all necessary tools.

## Prerequisites

- macOS (tested on recent versions)
- [Nix package manager](https://nixos.org/download.html) installed
- Git

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd homelab
   ```

2. **Enter the development environment:**
   ```bash
   nix develop
   ```

3. **Verify the setup:**
   ```bash
   kubectl version --client
   helm version
   kind version
   ```

## Development Environments

### Main Environment (`flake.nix`)

The main repository provides a comprehensive development environment:

**Included Tools:**
- `kubectl` - Kubernetes command-line tool
- `kubernetes-helm` - Helm package manager
- `kind` - Kubernetes in Docker for local testing
- `k9s` - Terminal-based Kubernetes UI
- `age` / `sops` - Secret management
- `jq` / `yq-go` - JSON/YAML processing
- `git`, `gnumake`, `coreutils`, `gnused` - Core development tools

**macOS Compatibility Features:**
- `allowUnsupportedSystem = true` - Enables macOS support
- `allowUnfree = true` - Allows proprietary packages when needed
- Curated package list verified to work on macOS

### Sandbox Environment (`homelab-sandbox/`)

A lightweight environment for experimentation:

**Purpose:**
- Testing new Nix configurations
- Rapid prototyping
- Platform compatibility testing
- Independent from main repository changes

**Platform Detection:**
```nix
platformSpecificPackages = if pkgs.stdenv.isDarwin then [
  pkgs.coreutils
  pkgs.gnused
  pkgs.docker
] else [
  pkgs.iproute2
];
```

**Usage:**
```bash
cd homelab-sandbox
nix develop
```

## macOS-Specific Considerations

### Package Compatibility

Some packages from the original Linux environment have been replaced or removed for macOS compatibility:

**Removed (Linux-only):**
- `ansible` / `ansible-lint` - Use container-based approach
- `iproute2` - Linux networking tool
- Hardware-specific tools

**macOS Alternatives:**
- Use Docker for containerized tools
- Leverage `coreutils` and `gnused` for GNU tool compatibility
- Use `kind` for local Kubernetes testing instead of full metal provisioning

### Local Development Workflow

1. **Use Kind for Local Testing:**
   ```bash
   make create-cluster  # Creates local Kubernetes cluster
   make status          # Check cluster status
   ```

2. **Test Applications Locally:**
   ```bash
   helm template apps/homepage | kubectl apply -f -
   ```

3. **Clean Up:**
   ```bash
   make delete-cluster
   ```

## Recent Changes

### Commit History

The macOS compatibility work included these key changes:

- **Add macOS compatible flake.nix** - Initial macOS support
- **Simplify flake.nix for macOS compatibility** - Streamlined package selection
- **Add flake.lock for reproducible builds** - Version pinning for consistency

### Key Improvements

1. **Reproducible Builds:** `flake.lock` ensures consistent package versions across environments
2. **Platform Detection:** Automatic selection of macOS vs Linux packages
3. **Simplified Tool Set:** Focus on essential tools that work reliably on macOS
4. **Dual Environment:** Main repo for full development, sandbox for testing

## Troubleshooting

### Common Issues

**Nix not found:**
```bash
# Install Nix if not already installed
sh <(curl -L https://nixos.org/nix/install)
```

**Permission errors:**
```bash
# Ensure Nix daemon is running
sudo launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist
```

**Package not available on macOS:**
- Check if package is in the curated list
- Use Docker alternative if needed
- Test in sandbox environment first

### Getting Help

- Check the main [homelab documentation](https://homelab.khuedoan.com)
- Review [Nix documentation](https://nixos.org/manual/nix/stable/)
- Open an issue for macOS-specific problems

## Contributing

When adding new tools or making changes:

1. Test in sandbox environment first
2. Ensure compatibility with both macOS and Linux
3. Update package lists in both environments if needed
4. Regenerate `flake.lock` files after changes:
   ```bash
   nix flake update
   ```