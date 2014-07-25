# 引用 Aliyun

```ruby
gem 'aliyun',
    :github => 'mindpin/aliyun',
    :tag => '0.0.2'
```

# 使用

## 上传文件

```ruby
file = File.new("/xxx/yyy.jpg")
as = Aliyun::Service.new(:access_key_id => access_key_id, :secret_access_key => secret_access_key, :host => 'oss-cn-qingdao.aliyuncs.com' )
ab = as.bucket(bucket_name)
ab.object("/xxx/yyy/zzz.jpg").upload(file)
```

## 获取 url
```ruby
as = Aliyun::Service.new(:access_key_id => access_key_id, :secret_access_key => secret_access_key, :host => 'oss-cn-qingdao.aliyuncs.com' )
ab = as.bucket(bucket_name)
# http://bucket_name.oss-cn-qingdao.aliyuncs.com/xxx/yyy/zzz.jpg
ab.object("/xxx/yyy/zzz.jpg").url
```