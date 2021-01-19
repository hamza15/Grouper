Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '24f1873fc988bd1277b5', '58c34a6e483bc9da988f4cec7ddb0de88b1d2a4d'
  end