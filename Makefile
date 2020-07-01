#
# This script expects the following variables:
#      ROOT     
VAULTDOWNLOAD := "https://www.vaultproject.io/downloads/"

VAULTVERS = $$(wget -O - -q $(VAULTDOWNLOAD) | awk -f vault.awk  )
VAULTURL = https://releases.hashicorp.com/vault/$(VAULTVERS)/vault_$(VAULTVERS)_linux_amd64.zip

# $HELP$
# vaultbin                   Download and install latest version of vault
# vaultvers                  Print version of latest vault available

help:
	@echo Help not here yet.


# test target: get current version of vault
vaultvers:
	@echo "vault      " $(VAULTVERS)


build:
	@docker build -t dellelce/vault:$(VAULTVERS) -t dellelce/vault:latest  --build-arg VERSION=$(VAULTVERS) .
