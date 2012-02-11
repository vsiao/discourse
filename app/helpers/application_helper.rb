module ApplicationHelper  
  def broadcast(channel, &block)
    puts "channel: "+ channel
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://128.237.116.88:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
