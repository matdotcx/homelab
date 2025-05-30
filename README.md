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

Project status: **EXPERIMENTAL**

This is a macOS development fork focused on local testing and experimentation. It's designed for:
- Learning Kubernetes and GitOps concepts on macOS
- Local development and testing of homelab applications
- Prototyping before deploying to production hardware

**Not intended for production use** - for production deployments, use the [original project](https://github.com/khuedoan/homelab) on Linux hardware.

### Development Environment

This fork runs entirely on macOS using local development tools:

**Requirements:**
- macOS (tested on recent versions)
- [Nix package manager](https://nixos.org/download.html)
- Docker Desktop (for containerized applications)
- At least 8GB RAM recommended for local Kubernetes clusters

**Local Infrastructure:**
- Kind (Kubernetes in Docker) for local clusters
- Docker containers for application testing
- Nix development shells for reproducible environments

### Features

- [x] Common applications: Gitea, Jellyfin, Paperless...
- [x] Automated bare metal provisioning with PXE boot
- [x] Automated Kubernetes installation and management
- [x] Installing and managing applications using GitOps
- [x] Automatic rolling upgrade for OS and Kubernetes
- [x] Automatically update apps (with approval)
- [x] Modular architecture, easy to add or remove features/components
- [x] Automated certificate management
- [x] Automatically update DNS records for exposed services
- [x] VPN (Tailscale or Wireguard)
- [x] Expose services to the internet securely with [Cloudflare Tunnel](https://www.cloudflare.com/products/tunnel/)
- [x] CI/CD platform
- [x] Private container registry
- [x] Distributed storage
- [x] Support multiple environments (dev, prod)
- [x] Monitoring and alerting
- [x] Automated backup and restore
- [x] Single sign-on
- [x] Infrastructure testing

Some demo videos and screenshots are shown here.
They can't capture all the project's features, but they are sufficient to get a concept of it.

| Demo                                                                                                            |
| :--:                                                                                                            |
| [![][deploy-demo]](https://asciinema.org/a/xkBRkwC6e9RAzVuMDXH3nGHp7)                                           |
| Deploy with a single command (after updating the configuration files)                                           |
| [![][pxe-demo]](https://www.youtube.com/watch?v=y-d7btNNAT8)                                                    |
| PXE boot                                                                                                        |
| [![][hubble-demo]][hubble-demo]                                                                                 |
| Observe network traffic with Hubble, built on top of [Cilium](https://cilium.io) and eBPF                       |
| [![][homepage-demo]][homepage-demo]                                                                             |
| Homepage powered by... [Homepage](https://gethomepage.dev)                                                      |
| [![][grafana-demo]][grafana-demo]                                                                               |
| Monitoring dashboard powered by [Grafana](https://grafana.com)                                                  |
| [![][gitea-demo]][gitea-demo]                                                                                   |
| Git server powered by [Gitea](https://gitea.io/en-us)                                                           |
| [![][matrix-demo]][matrix-demo]                                                                                 |
| [Matrix](https://matrix.org/) chat server                                                                       |
| [![][woodpecker-demo]][woodpecker-demo]                                                                         |
| Continuous integration with [Woodpecker CI](https://woodpecker-ci.org)                                          |
| [![][argocd-demo]][argocd-demo]                                                                                 |
| Continuous deployment with [ArgoCD](https://argoproj.github.io/cd)                                              |
| [![][alert-demo]][alert-demo]                                                                                   |
| [ntfy](https://ntfy.sh) displaying received alerts                                                              |
| [![][ai-demo]][ai-demo]                                                                                         |
| Self-hosted AI powered by [Ollama](https://ollama.com) (experimental, not very fast because I don't have a GPU) |

[deploy-demo]: https://asciinema.org/a/xkBRkwC6e9RAzVuMDXH3nGHp7.svg
[pxe-demo]: https://user-images.githubusercontent.com/27996771/157303477-df2e7410-8f02-4648-a86c-71e6b7e89e35.png
[hubble-demo]: https://github.com/khuedoan/homelab/assets/27996771/9c6677d0-3564-47c0-852b-24b6a554b4a3
[homepage-demo]: https://github.com/khuedoan/homelab/assets/27996771/d0eaf620-be08-48d8-8420-40bcaa86093b
[grafana-demo]: https://github.com/khuedoan/homelab/assets/27996771/ad937b26-e9bc-4761-83ae-1c7f512ea97f
[gitea-demo]: https://github.com/khuedoan/homelab/assets/27996771/c245534f-88d9-4565-bde8-b39f60ccee9e
[matrix-demo]: https://user-images.githubusercontent.com/27996771/149448510-7163310c-2049-4ccd-901d-f11f605bfc32.png
[woodpecker-demo]: https://github.com/khuedoan/homelab/assets/27996771/5d887688-d20a-44c8-8f77-0c625527dfe4
[argocd-demo]: https://github.com/khuedoan/homelab/assets/27996771/527e2529-4fe1-4664-ab8a-b9eb3c492d20
[alert-demo]: https://github.com/khuedoan/homelab/assets/27996771/c922f755-e911-4ca0-9d4a-6e552d387f18
[ai-demo]: https://github.com/khuedoan/homelab/assets/27996771/d77ba511-00b7-47c3-9032-55679a099e70

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

- [Try it out locally](https://homelab.khuedoan.com/installation/sandbox) without any hardware (just 4 commands!)
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

Any contributions you make are greatly appreciated.

Please see [contributing guide](https://homelab.khuedoan.com/reference/contributing) for more information.

## License

Copyright &copy; 2020 - 2024 Khue Doan

Distributed under the GPLv3 License.
See [license page](https://homelab.khuedoan.com/reference/license) or `LICENSE.md` file for more information.

## Acknowledgements

References:

- [Ephemeral PXE server inspired by Minimal First Machine in the DC](https://speakerdeck.com/amcguign/minimal-first-machine-in-the-dc)
- [ArgoCD usage and monitoring configuration in locmai/humble](https://github.com/locmai/humble)
- [README template](https://github.com/othneildrew/Best-README-Template)
- [Run the same Cloudflare Tunnel across many `cloudflared` processes](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel)
- [MAC address environment variable in GRUB config](https://askubuntu.com/questions/1272400/how-do-i-automate-network-installation-of-many-ubuntu-18-04-systems-with-efi-and)
- [Official k3s systemd service file](https://github.com/k3s-io/k3s/blob/master/k3s.service)
- [Official Cloudflare Tunnel examples](https://github.com/cloudflare/argo-tunnel-examples)
- [Initialize GitOps repository on Gitea and integrate with Tekton by RedHat](https://github.com/redhat-scholars/tekton-tutorial/tree/master/triggers)
- [SSO configuration from xUnholy/k8s-gitops](https://github.com/xUnholy/k8s-gitops)
- [Pre-commit config from k8s-at-home/flux-cluster-template](https://github.com/k8s-at-home/flux-cluster-template)
- [Diátaxis technical documentation framework](https://diataxis.fr)
- [Official Terratest examples](https://github.com/gruntwork-io/terratest/tree/master/test)
- [Self-host an automated Jellyfin media streaming stack](https://zerodya.net/self-host-jellyfin-media-streaming-stack)
- [App Template Helm chart by bjw-s](https://bjw-s.github.io/helm-charts/docs/app-template)
- [Various application configurations in onedr0p/home-ops](https://github.com/onedr0p/home-ops)

Here is a list of the contributors who have helped to improve this project.
Big shout-out to them!

- ![](https://github.com/locmai.png?size=24) [@locmai](https://github.com/locmai)
- ![](https://github.com/MatthewJohn.png?size=24) [@MatthewJohn](https://github.com/MatthewJohn)
- ![](https://github.com/karpfediem.png?size=24) [@karpfediem](https://github.com/karpfediem)
- ![](https://github.com/linhng98.png?size=24) [@linhng98](https://github.com/linhng98)
- ![](https://github.com/elliotblackburn.png?size=24) [@elliotblackburn](https://github.com/elliotblackburn)
- ![](https://github.com/dotdiego.png?size=24) [@dotdiego](https://github.com/dotdiego)
- ![](https://github.com/Crimrose.png?size=24) [@Crimrose](https://github.com/Crimrose)
- ![](https://github.com/eventi.png?size=24) [@eventi](https://github.com/eventi)
- ![](https://github.com/Bourne-ID.png?size=24) [@Bourne-ID](https://github.com/Bourne-ID)
- ![](https://github.com/akwan.png?size=24) [@akwan](https://github.com/akwan)
- ![](https://github.com/trangmaiq.png?size=24) [@trangmaiq](https://github.com/trangmaiq)
- ![](https://github.com/tangowithfoxtrot.png?size=24) [@tangowithfoxtrot](https://github.com/tangowithfoxtrot)
- ![](https://github.com/raedkit.png?size=24) [@raedkit](https://github.com/raedkit)
- ![](https://github.com/ClashTheBunny.png?size=24) [@ClashTheBunny](https://github.com/ClashTheBunny)
- ![](https://github.com/retX0.png?size=24) [@retX0](https://github.com/retX0)

If you feel you're missing from this list, please feel free to add yourself in a PR.

## Stargazers over time

[![Stargazers over time](https://starchart.cc/khuedoan/homelab.svg)](https://starchart.cc/khuedoan/homelab)
