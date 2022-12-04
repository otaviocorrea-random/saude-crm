class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if DocumentosBr.valid_cpf?(value)
    record.errors.add(attribute.to_sym, 'não é válido')
  end
end