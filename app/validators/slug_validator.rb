class SlugValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\A[a-z-]+\z/
    record.errors[attribute] << (options[:message] || 'is not a valid slug')
  end
end
