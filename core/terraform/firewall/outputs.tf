output "private_ip_address" {
  # In force-tunnel mode the ip_configuration carries no public IP and Azure may
  # not populate private_ip_address. Fall back to the tunnel IP so that any
  # consumer of this output always receives a non-empty string.
  value = coalesce(
    try(azurerm_firewall.fw.ip_configuration[0].private_ip_address, ""),
    var.firewall_force_tunnel_ip
  )
}
output "firewall_policy_id" {
  value = azurerm_firewall_policy.root.id
}
