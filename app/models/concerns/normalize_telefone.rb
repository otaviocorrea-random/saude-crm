module NormalizeTelefone
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_telefone
  end

  def normalize_telefone
    self.telefone = get_telefone_formatted(telefone)
  end

  def get_telefone_formatted(telefone)
    telefone.scan(/\d/).join
  end
end
