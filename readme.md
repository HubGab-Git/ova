

aws ec2 import-image --description "Alpine from ova" --disk-containers "file://containers.json"



{
    "Description": "Alpine from ova",
    "ImportTaskId": "import-ami-04b620dde87e2a447",
    "Progress": "1",
    "SnapshotDetails": [
        {
            "Description": "Alpine from OVA",
            "DiskImageSize": 0.0,
            "Format": "OVA",
            "Url": "s3://alpineova/alpine-2.6.2.ova",
            "UserBucket": {
                "S3Bucket": "alpineova",
                "S3Key": "alpine-2.6.2.ova"
            }
        }
    ],
    "Status": "active",
    "StatusMessage": "pending"
}