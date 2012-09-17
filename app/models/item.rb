class Item < ActiveRecord::Base
  attr_accessible :data_publicacao, :id_zap, :valor, :link

  def notify
  	Notifier.novo_imovel(self).deliver
  end
end
