data "aws_iam_policy_document" "tf_state" {
  statement {
    sid = "assumeRole"
    actions = [
      "sts:AssumeRole"
    ]
    resources = [var.tf_state_role_arn]
  }
}

resource "aws_iam_policy" "tf_state" {
  name   = "${var.namespace}-tf-state-assume-role"
  path   = "/"
  policy = data.aws_iam_policy_document.tf_state.json
}
