# cabal install --only-dependencies
# cabal configure
# cabal build

GHCFLAGS=-Wall -fno-warn-name-shadowing -XHaskell98 -O2

dist/build/lunch-advisor/lunch-advisor: dist/setup-config src/Main.hs src/Routes.hs src/MustacheTemplates.hs src/Application.hs
	cabal build --ghc-options="$(GHCFLAGS)"

dist/setup-config: lunch-advisor.cabal
	cabal configure

src/Routes.hs: src/routes
	~/.cabal/bin/routeGenerator -r -n 1 -m Application $< > $@

src/MustacheTemplates.hs: src/Records.hs src/homePage.html.mustache
	mustache2hs -m src/Records.hs src/homePage.html.mustache HomePageData > $@

.PHONY: clean

clean:
	$(RM) src/*.o src/*.hi src/Main src/Routes.hs src/MustacheTemplates.hs
