FactoryBot.define do
  factory :municipio do
    nome { Faker::Address.city }
    estado { FactoryBot.create(:estado) }
    codigo_ibge { Faker::Number.number(digits: 7) }
  end
end