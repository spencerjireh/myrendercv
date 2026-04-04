# myrendercv

Personal CV/resume workspace powered by [RenderCV](https://github.com/rendercv/rendercv). A single YAML source file generates PDF, HTML, Markdown, and PNG outputs via Typst typesetting.

**Live site:** [spencerjireh.github.io/myrendercv](https://spencerjireh.github.io/myrendercv/)

## Resume Variants

Five tailored resumes are built from separate YAML configs, each emphasizing different experience:

| Variant | File | Focus |
|---|---|---|
| General | `Spencer_Jireh_Cebrian_CV.yaml` | Full-stack and AI (default) |
| Backend | `Spencer_Jireh_Cebrian_Backend_CV.yaml` | APIs, microservices, distributed systems |
| Fullstack | `Spencer_Jireh_Cebrian_Fullstack_CV.yaml` | End-to-end delivery |
| AI Engineer | `Spencer_Jireh_Cebrian_AI_Engineer_CV.yaml` | LLM agents, RAG, applied AI |
| Go Developer | `Spencer_Jireh_Cebrian_Go_Dev_CV.yaml` | Go, cloud infrastructure |

## Setup

```bash
uv sync                  # install dependencies
```

## Build

```bash
make all                 # render all public variants
make public              # same as make all
make backend             # render a single variant
make clean               # delete rendercv_output/
```

Output goes to `rendercv_output/` and is not tracked in git.

## Private Variants

Company-specific resume variants live in a separate private repository cloned locally into `private/`.

The public `Makefile` will automatically load `private/Makefile.private` when that private repo is present, so local private targets stay available without exposing any company-specific files or names in this repo.

## Deployment

A GitHub Actions workflow (`.github/workflows/render-and-deploy.yml`) renders only the public variants and deploys an explicit allowlist of PDFs, YAML files, and `docs/index.html` to GitHub Pages.

## Tech Stack

- [RenderCV](https://docs.rendercv.com) -- YAML-to-PDF pipeline using Typst
- [uv](https://docs.astral.sh/uv/) -- Python package manager
- GitHub Actions + GitHub Pages -- CI/CD and hosting
