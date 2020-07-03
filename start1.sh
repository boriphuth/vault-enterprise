# Make sure to download the enterprise binary from link below. The enterprise version will have +ent at the end of it. Don't use the .hsm version the regular one has HSM support:
# https://releases.hashicorp.com/vault/

#Use this command to start the Vault binary and reference the config.hcl file
vaultent server -log-level=trace -config /Users/sam/Deployments/HashiCorp/Vault/vault_ent_raft/vault-config1.hcl

#Vault is now running and log outputs will show in this terminal window
#Open another terminal window to continue interacting with Vault
#Use this command to initialize Vault with a single key shard
export VAULT_ADDR="http://127.0.0.1:8200"
vaultent operator init -key-shares=1 -key-threshold=1
 
#Copy the Unseal Key and Root Token to add to this file
#This will be required for continued use of this Vault instance in the future
# Unseal Key 1: 2rvFxTb+VuaJ2d06jUlwyQv9czEIHe1PDpxsyCpWpV4=
# Initial Root Token: s.KERByM6vD4jq9EbrlGP0Yeks
 
#Use this command to unseal the Vault
vaultent operator unseal 2rvFxTb+VuaJ2d06jUlwyQv9czEIHe1PDpxsyCpWpV4=
 
#Use this command to log into Vault as Root
vaultent login s.KERByM6vD4jq9EbrlGP0Yeks
 
#Use this command to license your Vault enterprise binary
vaultent write /sys/license text="01MV4UU43BK5HGYYTOJZWFQMTMNNEWU33JJZ5FSMCPI5FGUTKUIV2E46SNPFGVGMBTJZCEU3CMKRATEWSEM52FS3KONJHHUVJRLFKEE2SOPJITCSLJO5UVSM2WPJSEOOLULJMEUZTBK5IWST3JJJUU4R2ZPJHFOVLXJ5JTC3KPIRFGQTCXJUZVU2TDORNGU2DNJVJTAMS2KRLGQTTNKU2U4VCZPFNEOSLJJRBUU4DCNZHDAWKXPBZVSWCSOBRDENLGMFLVC2KPNFEXCSLJO5UWCWCOPJSFOVTGMRDWY5C2KNETMSLKJF3U22SBORGUISLUJVCE4VKNNJATMTKULE3E26SZOVHHU23YJV5FCMKOKRITGV3JJFZUS3SOGBMVQSRQLAZVE4DCK5KWST3JJF4U2RCJO5GFIQLZJRKEC6SWIRATCT3KIF3U62SBO5LWSSLTJFWVMNDDI5WHSWKYKJYGEMRVMZSEO3DULJJUSNSJNJEXOTLKIF2E2RCNORGUIVSVJVCFCNSOKRVTMTSUNN2U6VDLGVLWSSLTJFXFE3DDNUYXAYTNIYYGCVZZOVMDGUTQMJLVK2KPNFEXSTKEJF4EYVCBPFGFIQLYKZCECMCPNJKTKT3KKU2UY2TLGVHVM33JJRBUU53DNU4WWZCXJYYES2TPNFSG2RRRMJEFC2KMINFG2YSHIZXGG6KJGZSXSSTXLFLU44SZK5SGYSLKN5UWGSCKNRRFO3BRMJJUUOLGKE6T2LTWMF2WY5B2OYYTUYKTOBGTE3BQMNBEO5LIKM2VS5LHOMZS6Y3UNZYXS6LUNMXVMTCQJRTFCSTINRIFENTYOA2WCOLNJM3WG6KFKN4XCMRSGFWTMTKOKRYUQS3IOUVUKSLBJJGVEWDZIQ3VMTSHPBNEE5Z5HU"
 
#Use this command to verify the license was applied
vaultent read /sys/license