data "aws_iam_policy_document" "terraform_remote_state" {

  statement {
    sid = "s3bucketAccess"
    actions = [
      "s3:ListBucket"
    ]
    resources = [aws_s3_bucket.bucket.arn]
  }

  statement {
    sid = "s3bucketKeyAccess"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
  }

  statement {
    sid = "dynamodbAccess"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [aws_dynamodb_table.table.arn]
  }

}

resource "aws_iam_policy" "terraform_remote_state" {
  name        = "koffee-terraform-remote-state"
  description = "Managed by Terraform: provides access to the terraform remote state"
  path        = "/"
  policy      = data.aws_iam_policy_document.terraform_remote_state.json
}
