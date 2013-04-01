all: node_modules build example/index.html

node_modules: package.json
	@npm install

example/index.html: example/index.jade
	jade -P < $< --path $< > $@

build: components lib lib/style.css
	@component build --dev

components: component.json
	@component install --dev

lib:
	@mkdir -p lib

lib/style.css: src/style.styl
	stylus -u nib --compress < $< > $@

clean:
	@rm -rf example/index.html build lib

.PHONY: clean