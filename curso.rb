class Livro
  attr_reader :titulo, :preco, :ano_lancamento
  def initialize(titulo, preco, ano_lancamento)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula preco
  end

  def calcula(preco)
    return preco * 0.7 if @ano_lancamento < 2000
    preco
  end
end

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 2000
    puts 'Newsletter'
    puts livro.titulo
    puts livro.preco
  end
end


agile = Livro.new('Agile Web Development with Rails', 70.0, 2011)

puts agile
