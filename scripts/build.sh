#!/bin/sh -ex

if [ ! -d ./dist ]; then mkdir ./dist; fi
rm -rf ./dist/*

for code in 500 501 502 503 504; do
  erb type=error code="$code" template.html.erb > "dist/$code.html"
done

erb type=maintenance template.html.erb > dist/maintenance.html

for f in dist/*; do
  tidy -quiet -wrap 0 -indent -modify --tidy-mark 0 "$f"
done

tar -czf pages.tar.gz -C dist/ .
mv pages.tar.gz dist/
