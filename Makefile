SOURCE=./stdinread
LINKED=./.linked

help:
	@echo "uso: make [ help | link | upload ]"

link: $(SOURCE)/* $(LINKED)
$(LINKED):
	cd $(SOURCE); sudo npm link; cd ..
	touch $(LINKED)

upload:
	cd $(SOURCE); npm publish; cd ..

test:
	cd tests; npm i stdinread
	cd tests; node cat.mjs > /tmp/copy-cat.mjs
	cd tests; diff cat.mjs ~/tmp/copy-cat.mjs
