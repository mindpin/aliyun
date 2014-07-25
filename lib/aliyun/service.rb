module Aliyun

  class Service
    attr_reader :access_key_id, :access_key_secret, :host, :connection
    def initialize(options)
      @access_key_id = options.delete :access_key_id
      @access_key_secret = options.delete :access_key_secret
      @host = ( options.delete(:host) || "oss.aliyuncs.com" )
      @connection = Connection.new(:access_key_id => @access_key_id, :access_key_secret => @access_key_secret, :host => @host)
    end

    def bucket(name)
      Bucket.new(self, name)
    end
  end

end