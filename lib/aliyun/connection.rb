module Aliyun
  class Connection
    include Parser

    def initialize(options)
      @access_key_id = options.delete :access_key_id
      @access_key_secret = options.delete :access_key_secret
      @host = options.delete :host
    end

    def request(method, options)
      path = options.delete :path
      headers = options.delete(:headers) || {}   
      body = options.delete(:body) || nil
      method = method.to_s.upcase

      head_hash = Signature.generate(@access_key_id, @access_key_secret, :method => method, :path => URI.decode(path), :headers => headers)

      http = Net::HTTP.new(@host)
      # http.set_debug_output $stdout
      http.start do |http|
        r = http.send_request( method.to_s.upcase, path, body, head_hash)
        return handle_response(r)
      end
    end

    def handle_response(response)
      case response.code.to_i
      when 200...300
        return response
      else
        code,message = parse_error(response.body)
        raise Error::ResponseError.exception(code).new(message, response)
      end
    end

  end
end