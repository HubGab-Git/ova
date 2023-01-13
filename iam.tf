
resource "aws_iam_role" "ova" {
  name               = "vmimport"
  description        = "The role for OVA importer"
  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": {
"Effect": "Allow",
"Principal": {"Service": "vmie.amazonaws.com"},
"Action": "sts:AssumeRole"
"Condition": {
            "StringEquals":{
               "sts:Externalid": "vmimport"
            }
         }
}
}
EOF
}

data "aws_iam_policy_document" "ova" {
  statement {
    actions = [
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket" 
    ]
    resources = [
        "arn:aws:s3:::alpineova",
        "arn:aws:s3:::alpineova/*"
    ]
  }
  statement {
    actions = [
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject",
        "s3:GetBucketAcl"
    ]
    resources = [
        "arn:aws:s3:::alpineami",
        "arn:aws:s3:::alpineami/*"
    ]
  }
  statement {
    actions = [
        "ec2:ModifySnapshotAttribute",
        "ec2:CopySnapshot",
        "ec2:RegisterImage",
        "ec2:Describe*"
    ]
    resources = [
        "*"
    ]
  }
}


resource "aws_iam_policy" "ova" {
  policy = data.aws_iam_policy_document.ova.json
}

resource "aws_iam_role_policy_attachment" "ova" {
  role       = aws_iam_role.ova.name
  policy_arn = aws_iam_policy.ova.arn
}