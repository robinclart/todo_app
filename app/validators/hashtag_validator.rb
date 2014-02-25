class HashtagValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.match(/\#[a-z]+$/)
      record.errors.add attribute, :no_hashtag
    end
  end
end