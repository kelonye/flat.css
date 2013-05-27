public: node_modules components lib lib/style.css
	@component build --dev -n public -o public

node_modules:
	@npm install

components:
	@component install --dev

clean:
	@rm -rf public

.PHONY: clean