require "mail"

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    valid = begin
      address = Mail::Address.new(value)
      address.domain &&
        address.address == value &&
        address.send(:tree).domain.dot_atom_text.elements.size > 1
    rescue
      false
    end

    record.errors.add(attribute) unless valid
  end
end
