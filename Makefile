all: build example/index.html

example/index.html: example/index.jade
	jade -P < $< --path $< > $@

build: node_modules components lib lib/style.css
	@component build --dev

node_modules:
	@npm install

components:
	@component install --dev

lib:
	@mkdir -p lib

lib/style.css: src/style.styl
	stylus -u nib --compress < $< > $@

clean:
	@rm -rf example/index.html build lib

.PHONY: clean