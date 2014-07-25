# 引用 Aliyun

```ruby
gem 'aliyun',
    :github => 'mindpin/aliyun',
    :tag => '0.0.1'
```

# 使用

## 上传文件

```ruby
file = File.new("/xxx/yyy.jpg")
as = Aliyun::Service.new(:access_key_id => access_key_id, :secret_access_key => secret_access_key, :host => 'oss-cn-qingdao.aliyuncs.com' )
ab = as.bucket(bucket_name)
ab.object("/xxx/yyy/zzz.jpg").upload(file)
```