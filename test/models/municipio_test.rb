# == Schema Information
#
# Table name: municipios
#
#  id          :bigint           not null, primary key
#  codigo_ibge :string(10)
#  nome        :string(100)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  estado_id   :bigint           not null
#
# Indexes
#
#  index_municipios_on_codigo_ibge         (codigo_ibge) UNIQUE
#  index_municipios_on_estado_id           (estado_id)
#  index_municipios_on_nome_and_estado_id  (nome,estado_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (estado_id => estados.id)
#
require "test_helper"

class MunicipioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end