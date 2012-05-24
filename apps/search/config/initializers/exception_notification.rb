Rails.application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[WEHUB Exception] ",
  :sender_address => %{"notifier" <no-reply@waterenvironmentalhub.ca>},
  :exception_recipients => %w{adam.kahtava@tesera.com}
