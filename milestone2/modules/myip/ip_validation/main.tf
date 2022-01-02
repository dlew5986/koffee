variable "input" {
  type = string
  validation {
    condition = can(regex("^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",var.input))
    error_message = "Invalid IP address."
  }
}

output "output" {
  value = var.input
}
