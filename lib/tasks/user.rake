namespace :user do
  desc "Notify users"
  task notify_all: :environment do
    subscriptions = Subscription.where(notification_date: Date.today)
    subscriptions.each do |subscription|
      SendWhatsappMessage.new(subscription.user, "Dear #{subscription.user.first_name}, your subscription to the #{subscription.title} will expire in #{subscription.notify_before} days").call
    end
  end

  desc "Update Notification Date"
  task update_subscriptions: :environment do
    subscriptions = Subscription.where("? - start_date > trial", Date.today)
    subscriptions.each do |subscription|
      subscription.notification_date = subscription.start_date + Subscription::SUB_TYPES_TO_DAYS[subscription.sub_type] - subscription.notify_before
      subscription.save
    end
  end
end
