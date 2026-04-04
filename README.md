# myrendercv

Personal CV/resume workspace powered by [RenderCV](https://github.com/rendercv/rendercv). YAML source files generate PDF, HTML, Markdown, and PNG outputs via Typst typesetting.

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

If you have access to the companion private repo, clone it into `private/` after cloning this repository. The public `Makefile` automatically loads `private/Makefile.private` when present.

## Local Workflow

- Public resume variants live in the repository root and are safe to publish.
- Company-specific variants live in a separate companion repo cloned locally into `private/`.
- `private/` and `rendercv_output/` are not tracked by this repository.

## Build

```bash
make all                 # render all public variants
make public              # same as make all
make backend             # render a single variant
make <private-target>    # available only when private/ is present
make clean               # delete rendercv_output/
```

Output goes to `rendercv_output/` and is not tracked in git.

## Git Workflow

- Commit public changes from the repository root.
- Commit private changes from `private/`.
- Keep company-specific files, names, and targets out of tracked public files.

## Daily Git Workflow

Start of session:

```bash
git status -sb
git -C private status -sb
git pull --ff-only
git -C private pull --ff-only
```

Public-only changes:

```bash
make public
git add <public-files>
git commit -m "..."
git push
```

Private-only changes:

```bash
make <private-target>
git -C private add <private-files>
git -C private commit -m "..."
git -C private push
```

If a task touches both repos, commit and push the private repo first and the public repo second.

## Deployment

A GitHub Actions workflow (`.github/workflows/render-and-deploy.yml`) renders only the public variants and deploys an explicit allowlist of PDFs, YAML files, and `docs/index.html` to GitHub Pages.

## Tech Stack

- [RenderCV](https://docs.rendercv.com) -- YAML-to-PDF pipeline using Typst
- [uv](https://docs.astral.sh/uv/) -- Python package manager
- GitHub Actions + GitHub Pages -- CI/CD and hosting
