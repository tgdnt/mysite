#!/usr/bin/env bash
aws s3 sync _site/ s3://tgdnt.com --acl public-read --delete --profile tgdnt.com
aws cloudfront create-invalidation --distribution-id E21COGIAQQET3R --paths '/*' --profile tgdnt.com
