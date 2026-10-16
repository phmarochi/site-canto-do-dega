#!/bin/sh
# Gera index.html (site) e artifact.html (prévia) a partir de src/
cd "$(dirname "$0")"
FONTS='<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,500;1,400;1,500&family=Italiana&family=Jost:wght@300;400;500&display=swap">'
{ echo '<title>Chácara Canto do Dêga</title>'; echo '<meta name="claude:viewport-fit-sides" content="cover">'; echo "$FONTS"; cat src/page.html; } > artifact.html
{ cat src/head.html; echo "$FONTS"; awk '/^<style>/{p=1} p&&/^<\/style>/{print; exit} p' src/page.html; echo '</head>'; echo '<body>'; awk 'f{print} /^<\/style>/{f=1}' src/page.html; echo '</body>'; echo '</html>'; } > index.html
