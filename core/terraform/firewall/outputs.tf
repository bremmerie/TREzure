output "private_ip_address" {
  # In force-tunnel mode ip_configuration carries no public IP and private_ip_address
  # may be empty. Return the tunnel IP directly; in normal mode return the firewall's
  # private IP (or "" if not yet known during plan).
  value = var.firewall_force_tunnel_ip != "" ? var.firewall_force_tunnel_ip : try(azurerm_firewall.fw.ip_configuration[0].private_ip_address, "")
}
output "firewall_policy_id" {
  value = azurerm_firewall_policy.root.id
}
