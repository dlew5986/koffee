data "external" "curl" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

module "validate_ip" {
  source = "./ip_validation"
  input  = data.external.curl.result.ip
}

output "ip" {
  value = module.validate_ip.output
}

output "cidr" {
  value = "${module.validate_ip.output}/32"
}
