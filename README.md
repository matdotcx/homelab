# macOS Homelab

**[Features](#features) • [Get Started](#get-started) • [macOS Development Setup](./docs/getting-started/macos-development.md)**

[![license](https://img.shields.io/github/license/khuedoan/homelab?style=flat-square&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0.html)

This project is a **macOS-focused fork** of [Khue's Homelab](https://github.com/khuedoan/homelab), adapted for local development and testing on macOS systems. It utilizes [Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_code) and [GitOps](https://www.weave.works/technologies/gitops) principles with a development environment optimized for macOS.

**Key Differences from Original:**
- Native macOS development environment using Nix flakes
- Local Kubernetes testing with Kind instead of bare metal provisioning
- Platform-specific package selection for macOS compatibility
- Simplified toolchain focused on essential homelab development tools

> **What is a homelab?**
>
> Homelab is a laboratory at home where you can self-host, experiment with new technologies, practice for certifications, and so on.
> For more information, please see the [r/homelab introduction](https://www.reddit.com/r/homelab/wiki/introduction) and the
> [Home Operations Discord community](https://discord.gg/home-operations) (formerly known as [k8s-at-home](https://k8s-at-home.com)).

If you encounter an issue specific to the macOS adaptations, please create an issue in this repository. 
For general homelab questions, refer to the [original project](https://github.com/khuedoan/homelab) or the [Home Operations Discord community](https://discord.gg/home-operations).

## Overview

Project status: **EXPERIMENTAL and OFTEN BROKEN**

This is a macOS development fork focused on local testing and experimentation. It's designed for:
- Learning Kubernetes and GitOps concepts on macOS
- Local development and testing of homelab applications
- Prototyping before deploying to production hardware

**Not intended for production use** - for production deployments, use the [original project](https://github.com/khuedoan/homelab) on Linux hardware.

### Development Environment

This fork runs _entirely on macOS_ using local development tools:

**Requirements:**
- macOS (tested on recent versions)
- [Nix package manager](https://nixos.org/download.html)
- Docker Desktop (for containerized applications)
- At least 8GB RAM recommended for local Kubernetes clusters

**Local Infrastructure:**
- Kind (Kubernetes in Docker) for local clusters
- Docker containers for application testing
- Nix development shells for reproducible environments


### macOS Development Stack

<table>
    <tr>
        <th>Logo</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><img width="32" src="https://github.com/kubernetes-sigs/kind/raw/main/logo/logo.png"></td>
        <td><a href="https://kind.sigs.k8s.io">Kind</a></td>
        <td>Kubernetes in Docker - local clusters for testing</td>
    </tr>
    <tr>
        <td><img width="32" src="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png"></td>
        <td><a href="https://www.docker.com">Docker Desktop</a></td>
        <td>Containerization platform for macOS</td>
    </tr>
    <tr>
        <td><img width="32" src="https://raw.githubusercontent.com/NixOS/nixos-artwork/refs/heads/master/logo/nix-snowflake-colours.svg"></td>
        <td><a href="https://nixos.org">Nix</a></td>
        <td>Reproducible development environments with flakes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://helm.sh/img/helm.svg"></td>
        <td><a href="https://helm.sh">Helm</a></td>
        <td>Kubernetes package manager</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/13629408"></td>
        <td><a href="https://kubernetes.io">kubectl</a></td>
        <td>Kubernetes command-line tool</td>
    </tr>
    <tr>
        <td><img width="32" src="https://github.com/derailed/k9s/blob/master/assets/k9s.png?raw=true"></td>
        <td><a href="https://k9scli.io">K9s</a></td>
        <td>Terminal-based Kubernetes UI</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/30269780"></td>
        <td><a href="https://argoproj.github.io/cd">ArgoCD</a></td>
        <td>GitOps continuous deployment</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/3380462"></td>
        <td><a href="https://prometheus.io">Prometheus</a></td>
        <td>Monitoring and alerting (local testing)</td>
    </tr>
    <tr>
        <td><img width="32" src="https://grafana.com/static/img/menu/grafana2.svg"></td>
        <td><a href="https://grafana.com">Grafana</a></td>
        <td>Observability dashboards</td>
    </tr>
    <tr>
        <td><img width="32" src="https://upload.wikimedia.org/wikipedia/commons/b/bb/Gitea_Logo.svg"></td>
        <td><a href="https://gitea.com">Gitea</a></td>
        <td>Self-hosted Git service (containerized)</td>
    </tr>
    <tr>
        <td><img width="32" src="https://github.com/FiloSottile/age/raw/main/logo/logo.svg"></td>
        <td><a href="https://age-encryption.org">Age + SOPS</a></td>
        <td>Modern encryption and secret management</td>
    </tr>
    <tr>
        <td><img width="32" src="https://docs.renovatebot.com/assets/images/logo.png"></td>
        <td><a href="https://www.whitesourcesoftware.com/free-developer-tools/renovate">Renovate</a></td>
        <td>Automated dependency updates</td>
    </tr>
</table>

**Note:** This fork focuses on **local development tools** that work well on macOS. For production infrastructure components (bare metal provisioning, hardware networking, etc.), refer to the [original project](https://github.com/khuedoan/homelab).

## Get Started

- [Deploy on real hardware](https://homelab.khuedoan.com/installation/production/prerequisites) for production workload
- [macOS Development Setup](./docs/getting-started/macos-development.md) for local development on macOS

### Development Environments

This repository includes two development environments:

**Main Repository (`flake.nix`)**
- Full homelab development environment with all tools
- Optimized for macOS compatibility with `allowUnsupportedSystem = true`
- Includes essential Kubernetes and homelab management tools

**Sandbox Environment (`homelab-sandbox/`)**
- Lightweight, separate Git repository for testing and experimentation
- Platform-specific package selection (macOS vs Linux)
- Minimal set of tools for rapid prototyping
- Independent versioning and development cycle

## Roadmap

See [roadmap](https://homelab.khuedoan.com/reference/roadmap) and [open issues](https://github.com/khuedoan/homelab/issues) for a list of proposed features and known issues.

## Contributing

Any contributions you make are greatly appreciated, but please keep anything important to the original repo - see [contributing guide](https://homelab.khuedoan.com/reference/contributing) for more information.

## License

Copyright &copy; 2020 - 2024 Khue Doan

Distributed under the GPLv3 License.
See [license page](https://homelab.khuedoan.com/reference/license) or `LICENSE.md` file for more information.
