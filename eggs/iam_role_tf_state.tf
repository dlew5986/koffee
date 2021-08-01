data "aws_iam_policy_document" "assume_role_terraform_remote_state" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.terraform.arn]
    }
  }
}

resource "aws_iam_role" "terraform_remote_state" {
  name               = "koffee-terraform-remote-state"
  description        = "Managed by Terraform: role to assume to manage terraform remote state"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_terraform_remote_state.json
  max_session_duration = 43200
}

resource "aws_iam_role_policy_attachment" "terraform_remote_state" {
  role       = aws_iam_role.terraform_remote_state.name
  policy_arn = aws_iam_policy.terraform_remote_state.arn
}
