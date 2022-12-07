CHARM = charmed-kubernetes-localhost-ci-setup.charm

$(CHARM): hooks/* config.yaml metadata.yaml README.md
	@-echo -- Making Charm --
	@git rev-parse --short HEAD > version
	@zip -ur $(CHARM) version
	@rm version
	@zip -ur $(CHARM) hooks
	@zip -ur $(CHARM) metadata.yaml
	@zip -ur $(CHARM) manifest.yaml
	@zip -ur $(CHARM) config.yaml
	@zip -ur $(CHARM) README.md

clean:
	@-echo -- Cleaning Charm --
	@rm $(CHARM)

upload: $(CHARM)
	@charmcraft whoami