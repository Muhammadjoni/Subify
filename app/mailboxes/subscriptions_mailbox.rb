class SubscriptionsMailbox < ApplicationMailbox

  def process
    subscripiton_hash = {
      title: mail.subject,
      start_date: Date.today,
      sub_type: regex_data[:sub_type],
      price: regex_data[:price].to_i,
      currency: regex_data[:currency],
      category: regex_data[:category],
      notify_before: 1
    }

    create_subscriptions(user, subscripiton_hash)

  end

  private

  def create_subscriptions(user, subscripiton_hash)
    user.subscriptions.create!(subscripiton_hash)
  end

  def user
    @user ||= User.find_by(email: mail.from)
  end

  def regex_data
    @regex_data ||= mail.decoded.match(/(?<sub_type>(annual|monthly)).+(?<price>\d+.\d+).+(?<currency>(USD|EUR)).+(?<category>(Entertainment|Education|Finance))/)
  end

end

  # def process
  #   update_comments(task, mail.decoded)
  # rescue
  #   # Proper error handler here.
  # end

#   def update_comments(task, comment_string)
#     task.comments.create!(note: comment_string)
#   end

#   def find_task(subject)
#     task_id = subject.split("-").last.to_i
#     Task.find(task_id)
#   end
# end
