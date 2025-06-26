# timgitops

**timgitops** is a modular GitOps template powered by [FluxCD](https://fluxcd.io).  
It helps you manage Kubernetes infrastructure and applications declaratively across multiple environments (e.g., dev, staging, production).

This project follows GitOps best practices with a clean, scalable structure for teams building modern cloud-native platforms.

> **TL;DR:**  
> 
```
curl -s https://fluxcd.io/install.sh | sudo bash
flux install
kubectl apply -f https://raw.githubusercontent.com/timgitops/timgitops/refs/heads/main/clusters/dev/flux-system/gotk-sync.yaml
```

## ✨ Features

- 🌍 Multi-environment layout: `base`, `dev`, `staging`, `prod`
- 🧩 Reusable HelmRelease templates with environment overrides
- 🚀 Scalable structure for teams and microservices

## 📁 Repository Structure
```

.
├── apps                        # Kubernetes application definitions
│   ├── base                    # Shared app base configs for all environments
│   ├── dev                     # App definitions and pinned versions for the dev environment
│   ├── prod                    # App definitions and pinned versions for the production environment
│   └── staging                 # App definitions and pinned versions for the staging environment
├── clusters                    # Cluster-specific Flux bootstrap and Kustomizations
│   ├── dev
│   │   ├── apps                # App Kustomization for dev, references ./apps/dev
│   │   ├── flux-system         # Flux GitRepository and gotk-sync.yaml
│   │   │   └── gotk-sync.yaml  # Root Kustomization entrypoint for syncing Flux
│   │   ├── infra               # Infra Kustomization for dev, references ./infra/dev
│   │   └── kustomization.yaml  # Cluster composition root for dev
│   ├── prod
│   │   ├── apps                # App Kustomization for production, references ./apps/prod
│   │   ├── flux-system         # Flux GitRepository and gotk-sync.yaml
│   │   ├── infra               # Infra Kustomization for production, references ./infra/prod
│   │   └── kustomization.yaml  # Cluster composition root for production
│   └── staging
│       ├── apps                # App Kustomization for staging, references ./apps/staging
│       ├── flux-system         # Flux GitRepository and gotk-sync.yaml
│       ├── infra               # Infra Kustomization for staging, references ./infra/staging
│       └── kustomization.yaml  # Cluster composition root for staging
└── infra                       # Kubernetes infrastructure components
    ├── base                    # Shared infra configs (CRDs, cluster-wide settings) for all environments
    ├── dev                     # Infra components and pinned versions for dev (e.g., ingress, secrets)
    ├── prod                    # Infra components and pinned versions for production
    └── staging                 # Infra components and pinned versions for staging
```

## 🚀 Getting Started

1. Bootstrap FluxCD into your cluster
2. Apply the `clusters/<env>/flux-system/gotk-sync.yaml`
3. Add apps and infrastructure modules as needed

## 📖 License

This project is licensed under the [MIT License](LICENSE).

---

Built and maintained by [@timgitops](https://github.com/timgitops)
