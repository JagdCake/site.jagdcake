dir.dev = ./
dir.prod = ./docs/

dir.dev.css = $(dir.dev)/css/
dir.dev.images = $(dir.dev)/images/

dir.prod.css = $(dir.prod)/css/
dir.prod.images = $(dir.prod)/images/

css.dev = $(dir.dev.css)/main.css

html.prod = $(dir.prod)/index.html
css.prod = $(dir.prod.css)/main.css

css/main.css: css/tailwind.css tailwind.config.js
	npx tailwind build css/tailwind.css -o css/main.css
