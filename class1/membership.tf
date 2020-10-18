
resource "aws_iam_group_membership" "developers_team" {
  name = "develepers-group-membership"

  users = [
    "${aws_iam_user.tim.name}"
  ]

  group = "${aws_iam_group.developers.name}"
}