lib=$(shell find lib -type f)
component = ./node_modules/component-hooks/node_modules/.bin/component

public: node_modules components $(lib)
	@$(component) build --dev -n public -o public

node_modules:
	@npm install

components:
	@$(component) install --dev

clean:
	@rm -rf public

.PHONY: clean