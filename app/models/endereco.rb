# == Schema Information
#
# Table name: enderecos
#
#  id           :bigint           not null, primary key
#  cep          :string
#  complemento  :string
#  logradouro   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  municipe_id  :bigint           not null
#  municipio_id :bigint           not null
#
# Indexes
#
#  index_enderecos_on_municipe_id   (municipe_id) UNIQUE
#  index_enderecos_on_municipio_id  (municipio_id)
#
# Foreign Keys
#
#  fk_rails_...  (municipe_id => municipes.id)
#  fk_rails_...  (municipio_id => municipios.id)
#
class Endereco < ApplicationRecord
  belongs_to :municipio
  belongs_to :municipe

  validates :cep, presence: true
  validates :logradouro, presence: true
  validates :municipio, presence: true
  validates :municipe, presence: true
end
