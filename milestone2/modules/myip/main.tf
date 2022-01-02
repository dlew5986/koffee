data "external" "curl" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

module "validate_ip" {
  source = "./ip_validation"
  input  = data.external.curl.result.ip
}

output "my_public_ip" {
  #value = "${data.external.myipaddr.result.ip}/32"
  value = module.validate_ip.output
}
