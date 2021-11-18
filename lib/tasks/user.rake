namespace :user do
  desc "Notify users"
  task notify_all: :environment do
    subscriptions = Subscription.where(notification_date: Date.today)
    subscriptions.each do |subscription|
      SendWhatsappMessage.new(subscription.user, "Dear #{subscription.user.first_name}, your subscription to the #{subscription.title} will expire in #{subscription.notify_before} days").call
    end
  end
end
