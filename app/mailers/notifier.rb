class Notifier < ActionMailer::Base
  default from: ENV['EMAIL_FROM']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.novo_imovel.subject
  #
  def novo_imovel(item)
    @imovel = item

    mail to: ENV['EMAIL_TO']
  end
end
