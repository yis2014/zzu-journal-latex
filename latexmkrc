# Overleaf reads latexmkrc; local latexmk also accepts this filename.
$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1 %O %S';
$clean_ext = 'synctex.gz run.xml';
