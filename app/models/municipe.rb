# == Schema Information
#
# Table name: municipes
#
#  id              :bigint           not null, primary key
#  cns             :string           not null
#  cpf             :string(14)       not null
#  data_nascimento :date             not null
#  email           :string(100)      not null
#  foto            :string           not null
#  nome_completo   :string
#  status          :integer          default("inativo"), not null
#  telefone        :string(20)       not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  municipio_id    :bigint           not null
#
# Indexes
#
#  index_municipes_on_cpf           (cpf) UNIQUE
#  index_municipes_on_email         (email) UNIQUE
#  index_municipes_on_municipio_id  (municipio_id)
#
# Foreign Keys
#
#  fk_rails_...  (municipio_id => municipios.id)
#
class Municipe < ApplicationRecord
  include NormalizeCpf
  include NormalizeTelefone

  belongs_to :municipio
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco

  enum status: { inativo: 0, ativo: 1 }

  mount_uploader :foto, Municipe::FotoUploader

  validates :nome_completo, presence: true
  validates :cpf, presence: true, cpf: true, uniqueness: true
  validates :cns, presence: true, cns: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :data_nascimento, presence: true, inclusion: { in: 120.years.ago..Date.today }
  validates :telefone, presence: true, uniqueness: true, length: { is: 13 }
  validates :foto, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }

  scope :filter_by_endereco, ->(endereco) {
    joins(:endereco).where('enderecos.logradouro ILIKE ?', "%#{endereco}%")
    .or(where('enderecos.complemento ILIKE ?', "%#{endereco}%"))
    .or(where('enderecos.cep ILIKE ?', "%#{endereco}%"))
  }

  scope :filter_by_municipio, ->(nome_municipio) { joins(:municipio).where('municipios.nome ILIKE ?', "%#{nome_municipio}%") }

  def data_nascimento_formatada
    data_nascimento.strftime('%d/%m/%Y')
  end
end
