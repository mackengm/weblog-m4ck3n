# lifted from https://www.digitalocean.com/community/questions/how-to-access-all-the-files-stored-in-a-spaces-folder

import boto3
import datetime

now = datetime.datetime.now()

session = boto3.session.Session()
client = session.client('s3',
                        region_name='nyc3',
                        endpoint_url='https://nyc3.digitaloceanspaces.com',
                        aws_access_key_id='EXCTRES7HHTR2P7YJ2SZ',
                        aws_secret_access_key='XH+AhKJZMrOJSBFaWeaky/qMhqy1b9fojjEJyy6u6Mk')

resp = client.list_objects(Bucket='images-summittdweller', Prefix='Norway-Photos-2019/')

target_date = "June 23, 2019"
x = datetime.datetime(2019, 6, 23)
yyyymmdd = x.strftime("%Y%m%d")
count = 0

print('---')
print('date: ', x.isoformat(), sep='')
print('title: Photoset Markdown - ', target_date, sep='')
print('location: Toledo, Iowa')
print('camera: iPhone 8')
print('weight: ', yyyymmdd, sep='')
print('draft: true')
print('---')
print(' ')

for obj in resp['Contents']:
  # print(obj['Key'])
  str = obj['Key'].strip()
  pos = str.find(target_date)
  if (pos > 0):
    print('<figure>')
    print('  <img src="https://images-summittdweller.nyc3.digitaloceanspaces.com/', str,'" />', sep='')
    print('  <figcaption> This photo needs a caption.</figcaption>')
    print('</figure>')
    print(' ')
    count += 1
    if (count == 1):
      print('<!--more-->')
      print(' ')
