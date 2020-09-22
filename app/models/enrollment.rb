class Enrollment < ApplicationRecord
  # Chama referência de outras classes
  belongs_to :institution
  belongs_to :student

  has_many :bills

  # Realiza as validações necessárias
  validates :valor_total, numericality: { greater_than: 0, message: "Valor total não informado ou inválido."}
	validates :quant_faturas, numericality: { greater_than: 0, message: "Quantidade de faturas inválida ou não informada."} 
	validates :dia_vencimento, numericality: { greater_than: 0, less_than: 32, message: "Dia inválido ou não informado." }
  validates :curso, presence: { message: "Curso não informado."}

  after_create :cria_faturas # Após a criação da matrícula, chama o método de criação das faturas 

  # Método que cria as faturas

  private
  def cria_faturas
    # Recebe a data atual, dia, mês e ano
    @t = Time.now

    @dia = @t.strftime("%d").to_i
    @mes = @t.strftime("%m").to_i
    @ano = @t.strftime("%Y").to_i

    # Verifica se a cobrança começará no mês vigente ou no próximo
    if self.dia_vencimento <= @dia
      @mes += 1
    end

    @dia = self.dia_vencimento

    # Método que retorna a quantidade de dias do mês
    def max(mes)
      if mes == 2
        return 28
      elsif mes == 4 || mes == 6 || mes == 9 || mes == 11
        return 30
      else
        return 31
      end
    end

    # Calcula o valor de cada fatura
    @valor = self.valor_total / self.quant_faturas
    @valor = @valor.round(2)

    self.quant_faturas.times do |index|
      @sinal = 0

      # Verifica se o ano já acabou
      if @mes > 12
        @ano += 1
        @mes = 1
      end

      # Se o dia de vencimento é maior que 28, é necessário um tratamento diferente para cada mês
      # Em meses que não possuírem o dia de vencimento, a fatura passa para o dia 1 do próximo mês
      if @dia > 28
        @max_dias_mes = max(@mes)
        if @dia > @max_dias_mes
          @dia = 1
          @mes += 1
          @sinal = 1  # Esta variável sinaliza que o mês já foi incrementado, portanto não precisará ser incrementado posteriormente
        end
      end

      # Coloca os zeros a esquerda de números menores que 10
      @dia = ("%.2d" % @dia)
      @mes = ("%.2d" % @mes)

      # Cria a fatura
      Bill.create ({
        valor_fatura: "#{@valor}",
        data_vencimento: "#{@ano}-#{@mes}-#{@dia}",
        enrollment_id: self.id,
        status: "Aberta"
      })
      
      @dia = @dia.to_i
      @mes = @mes.to_i

      # Atualiza o mês, caso já não tenha sido atualizado
      if @sinal == 0
        @mes += 1
      else
        @dia = self.dia_vencimento # Retorna o dia do vencimento como sendo o dia de cobrança
      end
    end    
  end
end


