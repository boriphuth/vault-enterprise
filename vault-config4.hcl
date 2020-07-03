// the ‘file_transactional’ storage backend, it’s undocumented but works well for replication and you don’t lose state when you stop Vault. I'm only using this for demos. Customers need Consul or Raft

storage "file_transactional" {
  path          = "/Users/sam/Deployments/HashiCorp/vault_ent/data4"
  redirect_addr = "http://127.0.0.1:8206"
}

 
ui = true
 
listener "tcp" {
 address     = "127.0.0.1:8206"
 tls_disable = 1
}
