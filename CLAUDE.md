# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## Project Overview

RenderCV workspace for generating public resume variants. The tracked repository contains only publishable resume YAMLs and deployment assets.

An optional companion private repository may be cloned locally into `private/`. That private repo contains company-specific resume variants and `private/Makefile.private`.

## Repo Boundaries

- Public resume YAMLs live in the repository root.
- Private company-specific YAMLs belong only in `private/company/`.
- `private/` is gitignored by the public repository.
- Generated files go to `rendercv_output/` and are not tracked.
- GitHub Pages deploys only the explicit public allowlist defined in `.github/workflows/render-and-deploy.yml`.

## Commands

```bash
uv sync
make public
make all
make base
make backend
make fullstack
make ai
make go
make clean
```

If the companion private repo is present, additional private targets may be loaded through `private/Makefile.private`.

## Public Safety Rules

- Never add company-specific files, names, filenames, targets, or documentation to the tracked public repository.
- Never reintroduce a tracked `company/` directory at the repository root.
- Never widen the GitHub Pages workflow from explicit public file copies to broad wildcards.
- Never commit `rendercv_output/`.
- Keep public documentation generic and free of private company references.
- Commit public changes from the repository root.
- Commit private changes from `private/` with its own git history.

## YAML Structure

Each public resume YAML follows the RenderCV schema at `https://raw.githubusercontent.com/rendercv/rendercv/refs/tags/v2.6/schema.json`.

Four top-level keys:
- **`cv:`** -- Personal info (`name`, `email`, `website`, `social_networks`) and `sections:` containing CV content
- **`design:`** -- Theme (`engineeringresumes`), page margins, colors, typography, header layout, section title style, entry formatting, and template strings
- **`locale:`** -- Language setting
- **`settings:`** -- `current_date` used for rendering

## CV Entry Types

Each section under `cv.sections` uses a specific entry type. Fields vary by type:

- **`experience_entry`** -- `company`, `position`, `start_date`, `end_date`, `location`, `summary`, `highlights`
- **`education_entry`** -- `institution`, `area`, `degree`, `date`, `location`, `summary`, `highlights`
- **`normal_entry`** -- `name`, `date`, `location`, `summary`, `highlights`
- **`one_line_entry`** -- `label`, `details` or `name`, `date`

Use `**bold**` markdown for emphasis within strings. Quote strings with colons or special characters when needed.

## Template Placeholders

The `design.templates` section maps placeholders such as `INSTITUTION`, `DEGREE`, `AREA`, `COMPANY`, `POSITION`, `NAME`, `SUMMARY`, `HIGHLIGHTS`, `DATE`, and `LOCATION` to YAML fields at render time.

## Design

Uses the `engineeringresumes` theme with XCharter font, justified alignment, US Letter size, and navy-blue accents (`rgb(45, 55, 90)`) for name and section titles. See [RenderCV docs](https://docs.rendercv.com) for available design options.
