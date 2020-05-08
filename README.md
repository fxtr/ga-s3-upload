# S3 upload

Github action to upload to S3 and add a version to the name

Used inputs
- github_ref
- bucket_name
- bucket_path
- no_release_path
- target

if `BRANCH_NAME` satisfies regex `^[a-zA-Z0-9]\.[a-zA-Z0-9]\.[a-zA-Z0-9]$` then `RELEASE_VERSION` will be like 1.0.0
otherwise `RELEASE_VERSION` will be like `branchname-202002041154`

if `no_release_path` is `true` `RELEASE_VERSION` will not be appended to `bucket_path`
