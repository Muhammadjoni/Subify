class ApplicationMailbox < ActionMailbox::Base
  routing all: :subscriptions
  # routing :all => :subscriptions
end
