resource "aws_sns_topic" "this" {
  name = "example-notification"
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn = aws_sns_topic.this.arn
  protocol  = "email"
  endpoint  = "no_reply@example.com"
}

#TODO
# Currently not working in due authentication
/*
resource "terraform_data" "this" {
  triggers_replace = var.message

  provisioner "local-exec" {
    command = <<EOF
    aws sns publish \
    --topic-arn "${aws_sns_topic.this.arn}" \
    --message "${var.message}"
    EOF

    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
}
*/
