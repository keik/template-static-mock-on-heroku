bin=$(shell npm bin)

build: clean
	@$(MAKE) -j dist/html dist/js dist/css dist/fonts dist/img

watch: build
	@$(MAKE) -j watch-html watch-js watch-css dev-server

## sub targets

dev-server:
	@$(bin)/http-server dist

### for build

dist/html: dist
	@cp src/*.html dist

dist/js: dist
	@$(bin)/browserify src/scripts/main.js -o dist/bundle.js

dist/css: dist
	@$(bin)/node-sass src/styles/main.scss -o dist

dist/fonts: dist
	@mkdir dist/fonts
	@cp -r node_modules/font-awesome/css node_modules/font-awesome/fonts dist/fonts

dist/img: dist
	@cp -r src/img dist/img

dist:
	@mkdir -p dist

### for watch

watch-html:
	@$(bin)/watchf 'src/**/*.html' -c 'cp {} dist'

watch-js:
	@$(bin)/watchify src/scripts/main.js -o dist/bundle.js -v

watch-css: node_modules
	@$(bin)/node-sass -w src/styles/main.scss -o dist

### misc

clean:
	@rm -rf dist
