class PeriodoFerias < ApplicationRecord
  belongs_to :colaborador
  validates :data_inicio, :data_fim, presence: true
  validate :data_inicio_deve_ser_maior_ou_igual_a_12_meses_apos_contratacao
  validate :duracao_deve_ser_maior_ou_igual_a_10_dias
  validate :nao_deve_haver_sobreposicao_de_periodos
  validate :duracao_total_deve_ser_menor_ou_igual_a_30_dias_por_periodo

  private

  def data_inicio_deve_ser_maior_ou_igual_a_12_meses_apos_contratacao
    if colaborador && data_inicio.present? && data_inicio < colaborador.data_contratacao + 1.year
      errors.add(:data_inicio, "deve ser pelo menos 12 meses após a contratação")
    end
  end

  def duracao_deve_ser_maior_ou_igual_a_10_dias
    if data_inicio.present? && data_fim.present? && (data_fim - data_inicio).to_i < 10
      errors.add(:data_fim, "deve ser pelo menos 10 dias após a data de início")
    end
  end

  def nao_deve_haver_sobreposicao_de_periodos
    if colaborador && colaborador.periodos_ferias.where.not(id: id).any? { |p| (p.data_inicio..p.data_fim).overlaps?(data_inicio..data_fim) }
      errors.add(:data_inicio, "já existe um período de férias para este colaborador nesse intervalo")
    end
  end

  def duracao_total_deve_ser_menor_ou_igual_a_30_dias_por_periodo
    if colaborador && colaborador.periodos_ferias.where("data_inicio >= ?", data_inicio - 1.year).sum { |p| (p.data_fim - p.data_inicio).to_i } + (data_fim - data_inicio).to_i > 30
      errors.add(:data_inicio, "a duração total dos períodos de férias não pode ultrapassar 30 dias por período de 12 meses")
    end
  end
end
