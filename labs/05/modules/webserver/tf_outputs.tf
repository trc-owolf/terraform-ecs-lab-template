output "web-server-URL" {
  description = "URL of the Apache web server - your browser may redirect to https - you may want to use a local curl or your smart phone or another browser"
  value       = join("", ["http://", aws_eip.static-ip.public_ip, ":80"])
}

output "web-server-DNS" {
  description = "DNS of the Apache web server - your browser may redirect to https - you may want to use a local curl or your smart phone or another browser"
  value       = join("", ["http://", aws_instance.webserver.public_dns, ":80"])
}
