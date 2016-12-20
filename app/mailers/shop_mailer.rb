class ShopMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shop_mailer.partnership_demand.subject
  #
  def partnership_demand(shop)
    @shop = shop
    @greeting = "Hi"

    mail to: "martin.bragard@robinfood.store", subject: "New partnership demand"
  end
end
