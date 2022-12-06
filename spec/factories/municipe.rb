FactoryBot.define do
  factory :municipe do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { DocumentosBr.cpf_formatted }
    data_nascimento { Faker::Date.birthday(min_age: 18, max_age: 65) }
    municipio { FactoryBot.create(:municipio) }
    status { :ativo }

    trait :com_endereco do
      endereco { FactoryBot.build(:endereco) }
    end
  end
end