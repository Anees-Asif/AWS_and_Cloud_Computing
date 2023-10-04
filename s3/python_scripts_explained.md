# Python scripts using boto3

Below are the scripts i have produced to complete the tasks assigned.

### Create a bucket

 This script creates a bucket in the eu-west-1 region using boto3 and accepts the bucket name as an argument.

``` python
import sys
import boto3

if len(sys.argv) != 2:
    print("Usage: python create_bucket.py <bucket_name>")
    sys.exit(1)

bucket_name = sys.argv[1]

# Initialize the S3 client with the eu-west-1 region
s3 = boto3.client('s3', region_name='eu-west-1')

# Create the S3 bucket
s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration={'LocationConstraint': 'eu-west-1'})
```

### Upload a file

This script uploads a local file to an S3 bucket. The object name is the name of the file once it is stored on the bucket.

```python
import sys
import boto3

if len(sys.argv) != 4:
    print("Usage: python upload_file.py <bucket_name> <local_file_path> <s3_object_name>")
    sys.exit(1)
bucket_name = sys.argv[1]
local_file_path = sys.argv[2]
s3_object_name = sys.argv[3]

s3 = boto3.client('s3', region_name='eu-west-1')

# Upload the file to the S3 bucket
s3.upload_file(local_file_path, bucket_name, s3_object_name)
```
### Delete a bucket.

This script deletes a bucket, however if there are items in that bucket those items are first deleted, then the bucket itself is also deleted.

```python
import sys
import boto3

if len(sys.argv) != 2:
    print("Usage: python delete_bucket.py <bucket_name>")
    sys.exit(1)

bucket_name = sys.argv[1]

s3 = boto3.client('s3', region_name='eu-west-1')

# List objects in the bucket
objects = s3.list_objects_v2(Bucket=bucket_name)

# Delete all objects in the bucket
if 'Contents' in objects:
    for obj in objects['Contents']:
        s3.delete_object(Bucket=bucket_name, Key=obj['Key'])

# Delete the S3 bucket
s3.delete_bucket(Bucket=bucket_name)
```

### Download a file 

The reverse of the upload file, this downloads a file and the object name is the name of the file once it has downloaded to your instance.

```python
import sys
import boto3

if len(sys.argv) != 4:
    print("Usage: python download_file.py <bucket_name> <s3_object_name> <local_file_path>")
    sys.exit(1)

bucket_name = sys.argv[1]
s3_object_name = sys.argv[2]
local_file_path = sys.argv[3]

s3 = boto3.client('s3', region_name='eu-west-1')

# Download the file from the S3 bucket
s3.download_file(bucket_name, s3_object_name, local_file_path)

```

### List all bucket available.

This lists all S3 buckets available to us.

```python
import boto3

s3 = boto3.client('s3')

response = s3.list_buckets()

# Print the names of the buckets
print("List of S3 Buckets:")
for bucket in response['Buckets']:
    print(bucket['Name'])
```

### Delete a specific file

This script deletes a specific file that is given in the command-line arguments.

```python
import sys
import boto3

if len(sys.argv) != 3:
    print("Usage: python delete_file.py <bucket_name> <s3_object_name>")
    sys.exit(1)

bucket_name = sys.argv[1]
s3_object_name = sys.argv[2]

s3 = boto3.client('s3', region_name='eu-west-1')

# Delete the specified file from the S3 bucket
s3.delete_object(Bucket=bucket_name, Key=s3_object_name)

print(f"{s3_object_name} deleted from {bucket_name}.")
```