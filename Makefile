REF = HEAD
HASH = $(shell git rev-list -n 1 --abbrev-commit $(REF))

ARCHIVE = vim-coffee-script-$(HASH).zip
ARCHIVE_DIRS = after ftdetect ftplugin indent syntax

# Nothing to do by default
all:

archive:
	git archive $(REF) $(ARCHIVE_DIRS) -o $(ARCHIVE)

clean:
	-rm -f $(ARCHIVE)

# For easy copypasta into vim.org
hash:
	@echo $(HASH)

coffeeAll:
	@grep -E 'syn (match|region)' syntax/coffee.vim |\
	 grep -v 'contained' |\
	 awk '{print $$3}' |\
	 uniq |\
	 grep -vE 'Error|coffeeAssignString|coffeeHeregexComment|coffeeInterp'

.PHONY: archive clean hash coffeeAll
