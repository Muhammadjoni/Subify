class ApplicationMailbox < ActionMailbox::Base
  routing :all => :subscriptions
  # routing /something/i => :somewhere
end
