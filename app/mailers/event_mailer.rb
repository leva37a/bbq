class EventMailer < ApplicationMailer

  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: default_i18n_subject(event_title: @event.title)
  end

  def comment(comment, email)
    @comment = comment

    mail to: email, subject: default_i18n_subject(event_title: @comment.event.title)
  end
end
