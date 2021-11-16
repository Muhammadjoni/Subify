class SendWhatsappMessage
  attr_reader :message, :user

  def initialize(user, message)
    @user = user
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: "whatsapp:+14155238886",
      to: "whatsapp:#{user.sms_number}",
      body: message
    })
  end
end
