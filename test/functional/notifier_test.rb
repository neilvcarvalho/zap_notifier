require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "novo_imovel" do
    mail = Notifier.novo_imovel
    assert_equal "Novo imovel", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
