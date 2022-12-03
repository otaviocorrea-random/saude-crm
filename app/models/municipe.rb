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
  belongs_to :municipio
  has_one :endereco

  enum status: { inativo: 0, ativo: 1 }

  validates :nome_completo, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :cns, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :data_nascimento, presence: true, inclusion: { in: 120.years.ago..Date.today }
  validates :telefone, presence: true
  validates :foto, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
end
