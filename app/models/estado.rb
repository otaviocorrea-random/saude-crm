# == Schema Information
#
# Table name: estados
#
#  id         :bigint           not null, primary key
#  nome       :string(100)      not null
#  sigla      :string(2)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_estados_on_nome   (nome) UNIQUE
#  index_estados_on_sigla  (sigla) UNIQUE
#
class Estado < ApplicationRecord
  has_many :municipios
end
