module SmsTool
  def self.send_sms(num:, msg:)
    puts "Sending  sms..."
    puts "#{msg} to #{num}"
  end
end