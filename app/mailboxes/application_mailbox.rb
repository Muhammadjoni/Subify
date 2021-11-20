class ApplicationMailbox < ActionMailbox::Base
  routing /subscription/ => :subscriptions
end
