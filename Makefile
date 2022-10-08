#
# This script expects the following variables:
#      ROOT     
VAULTDOWNLOAD := "https://www.vaultproject.io/downloads"

VAULTVERS = $$(wget -O - -q $(VAULTDOWNLOAD) | awk -f vault.awk  )
VAULTURL = https://releases.hashicorp.com/vault/$(VAULTVERS)/vault_$(VAULTVERS)_linux_amd64.zip

IMAGE = "dellelce/vault"

# $HELP$
# vaultbin                   Download and install latest version of vault
# vaultvers                  Print version of latest vault available

help:
	@echo Help not here yet.


# test target: get current version of vault
vaultvers:
	@echo "vault      " $(VAULTVERS)

# download and install vault in bin directory
bin/vault:
	@wget -q -O bin/vault.zip $(VAULTURL) && unzip -q bin/vault.zip -d bin && \
         rm bin/vault.zip && ls -lt bin/vault

vaultbin: bin/vault

# next two targets are mostly for testing
vaultzip: bin/vault.zip

bin/vault.zip:
	@wget -q -O bin/vault.zip $(VAULTURL)

# docker build
build:
	@docker build -t $(IMAGE):$(VAULTVERS) -t $(IMAGE):latest  --build-arg VERSION=$(VAULTVERS) .

rundev:
	@docker run -it --rm $(IMAGE):latest server -dev
