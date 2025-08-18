# provider "aws" {
#     region = "us-east-1"
# }

# resource "aws_iam_user" "demo-user-1" {
#   name   = "demo-user-1"
# }

# # Policy points to S3 list permissions.

# resource "aws_iam_policy" "demo-policy-1" {
#   name = "demo-policy-1"
#   policy = jsonencode({
# 	"Version" : "2012-10-17",
# 	"Statement": [
# 		{
# 			"Sid": "VisualEditor0",
# 			"Effect": "Allow",
# 			"Action": [
# 				"s3:ListAccessPointsForObjectLambda",
# 				"s3:ListBucketMultipartUploads",
# 				"s3:ListAccessPoints",
# 				"s3:ListCallerAccessGrants",
# 				"s3:ListBucketVersions",
# 				"s3:ListJobs",
# 				"s3:ListBucket",
# 				"s3:ListMultiRegionAccessPoints",
# 				"s3:ListStorageLensGroups",
# 				"s3:ListAccessGrantsLocations",
# 				"s3:ListMultipartUploadParts",
# 				"s3:ListStorageLensConfigurations",
# 				"s3:ListTagsForResource",
# 				"s3:ListAllMyBuckets",
# 				"s3:ListAccessGrantsInstances",
# 				"s3:ListAccessGrants"
# 			],
# 			"Resource": "*"
# 		}
# 	]
# })
# }

# resource "aws_iam_policy_attachment" "atatch-demo-policy-1" {
#     name = "demo-policy-attach"
#     policy_arn = aws_iam_policy.demo-policy-1.arn
#     users = [aws_iam_user.demo-user-1.name]
# }