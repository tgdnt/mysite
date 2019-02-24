#!/usr/bin/env bash
aws s3 sync _site/ s3://tgdnt.com --acl public-read --delete
aws configure set preview.cloudfront true
aws cloudfront create-invalidation --distribution-id E21COGIAQQET3R --paths '/*'
