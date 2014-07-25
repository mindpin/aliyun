module Aliyun
  class Signature
    
    def self.generate(access_key_id, access_key_secret, options)
      method = options.delete(:method)
      path   = options.delete(:path)
      headers = options.delete(:headers) || {}
      md5 = headers.delete :md5
      content_type = headers.delete :content_type

      date = Time.now.gmtime.strftime('%a, %d %b %Y %H:%M:%S GMT')

      oss_sign = ali_oss_sign(access_key_secret, method, date, path,
        :headers => headers, :md5 => md5, :content_type => content_type)

      hash = {'Authorization' => "OSS #{access_key_id}:#{oss_sign}", 'Date' => date}

      hash.merge!(headers) if !headers.empty?
      # 上传文件不传 md5 也行
      # hash.merge!("Content-MD5" => md5) if !md5.nil? && !md5.empty?
      hash.merge!("Content-Type" => content_type) if !content_type.nil? && !content_type.empty?

      hash
    end

    private
    def self.ali_oss_sign(access_key_secret, verb, date, res,options={})
      digest  = OpenSSL::Digest::Digest.new('sha1')

      md5 = options[:md5] || ''
      ty = options[:content_type] || ''

      header = ''
      unless options[:headers].empty?
        headers = options[:headers]
        header = headers.keys.sort.map{|keya|"#{keya}:#{headers[keya]}"}*"\n" + "\n"
      end

      str = "#{verb}\n\n#{ty}\n#{date}\n#{header}#{res}"
      
      bytemac = OpenSSL::HMAC.digest(digest, access_key_secret, str)
      res = Base64.encode64(bytemac).strip
    end

  end
end

