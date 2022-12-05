
class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if valid_cns?(value)
    record.errors.add(attribute.to_sym, 'não é válido')
  end

  private
  def valid_cns?(cns)
    return false unless (cns.match('[1-2]\\d{10}00[0-1]\\d') || cns.match('[7-9]\\d{14}'))
    return weighted_sum(cns) % 11 == 0; 
  end
  
  def weighted_sum(cns)
    total = 0
    cns.chars.each_with_index do |char, index|
      total += (char.to_i * (15 - index))
    end
    total
  end
end

  

