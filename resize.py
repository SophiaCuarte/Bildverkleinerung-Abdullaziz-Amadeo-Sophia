import boto3
import os
from PIL import Image

s3 = boto3.client('s3')

def handler(event, context):
    for record in event['Records']:
        bucket_name = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        resize_image(bucket_name, key)

def resize_image(bucket_name, key):
    download_path = '/tmp/{}'.format(key)
    upload_path = '/tmp/resized-{}'.format(key)

    s3.download_file(bucket_name, key, download_path)

    with Image.open(download_path) as image:
        image.thumbnail((100, 100))
        image.save(upload_path)

    s3.upload_file(upload_path, '{}-resized'.format(bucket_name), 'resized-{}'.format(key))

    os.remove(download_path)
    os.remove(upload_path)
