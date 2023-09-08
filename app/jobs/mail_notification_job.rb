class MailNotificationJob < ApplicationJob
  queue_as :default

  def perform(model)
    all_email = (model.event.subscriptions.map(&:user_email) + [model.event.user.email]).uniq - [model.user&.email]

    case model
    when Subscription
      EventMailer.subscription(model).deliver_now
    when Comment
      all_email.each do |mail|
        EventMailer.comment(model, mail).deliver_now
      end
    end
  end
end
