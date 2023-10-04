Called a bucket

Buckets - throw anything into it, theres no order, no structure.


## AWS CLI

Create an instance

Usual naming convention, ubuntu 18.04

SSH in

Sudo apt update and upgrade - get latest versions

### Install python on instance

install python `sudo apt install python -y`

install pip `sudo apt install python-pip -y`

install AWScli `sudo pip install awscli`

`aws configure`: When asked, enter aws access key ID. Then enter secret key.

Enter `eu-west-1` for region name

Enter `json` for output format

`aws s3 ls` lists all buckets on our server

## Using AWS CLI

start all commands with `aws` followed by `s3` (because we want to use s3).

`aws s3 mb s3://tech254-anees-bucket --region eu-west-1` - Make a bucket. Make sure to specify region.

` aws s3 cp example.txt s3://tech254-anees-bucket` to upload file to bucket.

`aws s3 sync s3://tech254-anees-bucket s3_downloads` - to download all files/folders from bucket

`aws s3 rm s3://tech254-anees-bucket/example.txt` - delete a file.

`aws s3 rb s3://tech254-anees-bucket` remove bucket.