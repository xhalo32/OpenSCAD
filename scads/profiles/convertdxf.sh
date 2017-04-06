inkscape -E intermediate.eps $1.svg
pstoedit -dt -f dxf:-polyaslines\ -mm intermediate.eps $1.dxf
rm intermediate.eps
