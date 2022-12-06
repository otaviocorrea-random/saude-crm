FactoryBot.define do
  factory :endereco do
    logradouro { Faker::Address.street_name  }
    cep { Faker::Address.zip_code }
    complemento { Faker::Address.secondary_address }
    municipio { FactoryBot.create(:municipio) }
  end
end