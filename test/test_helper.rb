require 'rubygems'
require 'riot'
require 'rr'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'dhun'

class Object
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure 
      eval("$#{stream} = #{stream.upcase}")
    end
    result
  end
  
end

Riot::Situation.instance_eval { include RR::Adapters::RRMethods }