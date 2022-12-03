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
require "test_helper"

class MunicipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
