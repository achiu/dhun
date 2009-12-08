require 'socket'
module Dhun
  class DhunClient
    def initialize(options)
      @options = options
      @socket = options[:socket]
      unless DhunClient.is_dhun_server_running?(@socket)
        raise "Dhun server is not running"
      end
    end

    def send(message)
      u = UNIXSocket.new(@socket)
      u.puts message
      u.close
    end

    def self.is_dhun_server_running?(socket)
      begin
        u = UNIXSocket.new(socket)
        return true
      rescue StandardError => ex
        puts "Connection Failed : #{ex.message}"
        return false
      end
    end
  end
end
