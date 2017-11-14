class ExampleMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    NotificationsMailer.notify_tutee(Tutee.first)
  end
end