.PHONY: create-prod-dir
.PHONY: copy-files-to-prod

dir.dev = ./
dir.prod = ./docs/

dir.dev.css = $(dir.dev)/css/
dir.dev.images = $(dir.dev)/images/

dir.prod.css = $(dir.prod)/css/
dir.prod.images = $(dir.prod)/images/

css.dev = $(dir.dev.css)/main.css

html.prod = $(dir.prod)/index.html
css.prod = $(dir.prod.css)/main.css
#
minify.html = html-minifier --case-sensitive --collapse-whitespace --remove-comments --minify-css --file-ext html
minify.css = csso

optimize.png = optipng -o5
optimize.svg = svgo

css/main.css: css/tailwind.css tailwind.config.js
	npx tailwind build css/tailwind.css -o css/main.css

create-prod-dir:
	mkdir $(dir.prod)/
	mkdir $(dir.prod.css)/
	mkdir $(dir.prod.images)/

copy-files-to-prod:
	cp $(css.dev) $(css.prod)
	cp -r $(dir.dev.images) $(dir.prod)/
