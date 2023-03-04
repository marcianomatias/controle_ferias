class Colaborador < ApplicationRecord
    has_many :periodos_ferias
    validates :nome, :cargo, :data_contratacao, presence: true
    validates :data_contratacao, date: { before_or_equal_to: Date.today }
    
    def dias_de_ferias
        agora = Time.now
        # calcula o tempo de trabalho em segundos
        tempo_trabalho = agora - self.data_contratacao.to_time
        # calcula o número de dias de férias a que tem direito
        dias_de_ferias = (tempo_trabalho / 1.year * 30).to_i
        # se o colaborador já tirou férias, subtrai os dias tirados do total
        dias_tirados = self.periodos_de_ferias.sum(:dias)
        dias_de_ferias - dias_tirados
      end
end
  