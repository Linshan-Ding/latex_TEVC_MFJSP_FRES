# latex_TEVC_MFJSP_FRES

Manuscript "Fluid-residual evolutionary search for multiplicity flexible job-shop scheduling" (target: IEEE TEVC).
Two roots share one set of tables, macros, figures and the glossary:

| Root | Class | Content |
|---|---|---|
| `main.tex` | IEEEtran (journal, two columns) | English manuscript, `sections/en/` |
| `main_zh.tex` | ctexart (A4, single column, 1.5 spacing) | Chinese manuscript, `sections/zh/`, same section files one to one |

Shared files write visible text as `\bi{中文}{English}`; each root defines `\bi` to keep one side. Tables, `macros/results.tex`
and `appendix/glossary.tex` are products of `paper_assets/scripts/make_tables.py` in the code repository and must not be edited
by hand. Figures are products of `paper_assets/figures/src/` (opt-paper-scifig); only PDFs enter `figures/`.

## Compile (XeLaTeX for both roots)

```
latexmk -xelatex main.tex
latexmk -xelatex main_zh.tex
```

`.latexmkrc` already selects XeLaTeX, so `latexmk main_zh.tex` works too. Clean with `latexmk -C`.

## Overleaf

Menu → Settings: **Compiler = XeLaTeX**, **Main document = main.tex** (English) or **main_zh.tex** (Chinese). Switch the main
document to read the other language; nothing else changes. The Chinese root uses the Fandol fonts bundled with TeX Live, so no
font upload is needed.

## Keeping the two languages in sync

Every `\label`, `\ref`, `\cite`, `\input{tables/...}`, numbered equation and subsection order must agree between
`sections/en/<n>.tex` and `sections/zh/<n>.tex`. The check lives in the code repository:

```
python paper_assets/scripts/check_zh_sync.py
```

## Regeneration and checks (run in the code repository root)

```
python paper_assets/scripts/build_data.py
python paper_assets/scripts/make_tables.py
python paper_assets/scripts/check.py
```

`PAPER_ROOT` overrides the default sibling path `../latex_TEVC_MFJSP_FRES`.

## Draft status

Sections 3 (problem) and 4 (method) are written; the abstract, introduction, related work, experiments and conclusions are
structured drafts with `\pending{}` claims, `\draftnote{}` boxes and `\figplace{}` figure briefs. Citations not yet verified
appear as `\citeneed{...}`; `refs.bib` holds only verified entries. The research proposal this manuscript follows is archived
at `Research-Proposals/opt/2026-11-mfjsp-fluid-residual-search/`.
