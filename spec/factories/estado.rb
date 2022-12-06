FactoryBot.define do
  factory :estado do
    nome { Faker::Address.state }
    sigla { Faker::Address.state_abbr }
  end
end