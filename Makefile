.PHONY: all
.PHONY: site-update

.PHONY: create-prod-dir
.PHONY: copy-files-to-prod
.PHONY: build-html
.PHONY: build-css
.PHONY: optimize-images

dir.dev = ./
dir.prod = ./docs/

dir.dev.css = $(dir.dev)/css/
dir.dev.images = $(dir.dev)/images/

dir.prod.css = $(dir.prod)/css/
dir.prod.images = $(dir.prod)/images/

html.dev = $(dir.dev)/index.html

html.prod = $(dir.prod)/index.html
css.prod = $(dir.prod.css)/main.css
#
minify.html = html-minifier --case-sensitive --collapse-whitespace --remove-comments --minify-css --file-ext html
minify.css = csso

optimize.png = optipng -o5
optimize.svg = svgo

all: css/main.css create-prod-dir copy-files-to-prod build-html build-css optimize-images

update: css/main.css copy-files-to-prod build-html build-css optimize-images

css/main.css: css/tailwind.css tailwind.config.js
	npm run compile-css

create-prod-dir:
	mkdir $(dir.prod)/
	mkdir $(dir.prod.css)/
	mkdir $(dir.prod.images)/

copy-files-to-prod:
	cp $(html.dev) $(dir.prod)/
	cp -r $(dir.dev.images) $(dir.prod)/

build-html:
	$(minify.html) --input-dir $(dir.prod)/ --output-dir $(dir.prod)/

build-css:
	# purges the CSS and copies the main.css file to the production dir
	npm run compile-css-prod
	$(minify.css) --input $(css.prod) --output $(css.prod)

optimize-images:
	$(optimize.png) $(dir.prod.images)/*.png
	$(optimize.svg) -f $(dir.prod.images)/
