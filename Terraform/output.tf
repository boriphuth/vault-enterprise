# Outputs file
output "vault_url" {
  value = "http://${google_compute_instance.vault-prim-uswest1-a.network_interface.0.access_config.0.nat_ip}:8200"
}
