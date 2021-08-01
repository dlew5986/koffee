resource "aws_iam_user_policy_attachment" "tf_state" {
  for_each   = toset(var.user_names)
  user       = each.value
  policy_arn = aws_iam_policy.tf_state.arn
}
