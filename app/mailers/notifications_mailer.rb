class NotificationsMailer < ApplicationMailer
	default from: "jttruitt95@gmail.com"



	def notify_tutee(tutee)
		@tutee = tutee
		mail(to: @tutee.email, subject: "Welcome to SLC Tutoring")
	end

	def notify_tutor(tutor)
		@tutor = tutor
		mail(to: @tutor.email, subject: "You have a new writer")
	end

end
