# S3 upload

Github action to upload to S3 and add a version to the name

Used inputs
- github_ref
- bucket_name
- bucket_path
- target

if `BRANCH_NAME` satisfies regex `^[a-zA-Z0-9]\.[a-zA-Z0-9]\.[a-zA-Z0-9]$` then `RELEASE_VERSION` will be like 1.0.0
otherwise `RELEASE_VERSION` will be like `branchname-202002041154`