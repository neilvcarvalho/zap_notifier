require 'zap'

namespace :zap do
	task :busca => :environment do
		Zap::Busca.new('http://www.zap.com.br/imoveis/rio-de-janeiro+rio-de-janeiro+sao-cristovao/imovel/aluguel/?ord=precolocacao', 1000)
	end
end