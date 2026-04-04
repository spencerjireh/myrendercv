# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

RenderCV workspace for generating a professional CV/resume. RenderCV takes a YAML configuration file and produces PDF, HTML, Markdown, and PNG outputs using Typst for typesetting.

## Commands

```bash
uv sync                                              # Install dependencies
uv run rendercv render Spencer_Jireh_Cebrian_CV.yaml  # Render CV to rendercv_output/
```

## YAML Structure

`Spencer_Jireh_Cebrian_CV.yaml` is the single source of truth. It uses the schema at `https://raw.githubusercontent.com/rendercv/rendercv/refs/tags/v2.6/schema.json`.

Four top-level keys:
- **`cv:`** -- Personal info (`name`, `email`, `website`, `social_networks`) and `sections:` containing all CV content
- **`design:`** -- Theme (`engineeringresumes`), page margins, colors, typography, header layout, section title style, entry formatting, and template strings
- **`locale:`** -- Language setting
- **`settings:`** -- `current_date` used for rendering (update this when regenerating)

## CV Entry Types

Each section under `cv.sections` uses a specific entry type. Fields vary by type:

- **experience_entry** -- `company`, `position`, `start_date`, `end_date`, `location`, `summary`, `highlights`
- **education_entry** -- `institution`, `area`, `degree`, `date`, `location`, `summary`, `highlights`
- **normal_entry** (projects) -- `name`, `date`, `location`, `summary`, `highlights`
- **one_line_entry** (skills, certifications) -- `label`, `details` (skills) or `name`, `date` (certifications)

Highlights are bullet-point lists. Use `**bold**` markdown for emphasis within strings. Strings with colons or special characters should be quoted.

## Template Placeholders

The `design.templates` section defines how each entry type renders. Placeholders (e.g., `INSTITUTION`, `DEGREE`, `AREA`, `COMPANY`, `POSITION`, `NAME`, `SUMMARY`, `HIGHLIGHTS`, `DATE`, `LOCATION`) map directly to entry fields and are replaced at render time.

## Design

Uses the `engineeringresumes` theme with XCharter font, justified alignment, US Letter size, and navy-blue accents (`rgb(45, 55, 90)`) for name and section titles. See [RenderCV docs](https://docs.rendercv.com) for all available design options.
