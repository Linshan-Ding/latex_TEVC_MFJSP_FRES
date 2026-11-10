# Both roots compile with XeLaTeX (ctexart needs it; IEEEtran root uses fontspec).
$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$bibtex_use = 2;
$clean_ext = 'synctex.gz xdv run.xml';
@default_files = ('main.tex');
