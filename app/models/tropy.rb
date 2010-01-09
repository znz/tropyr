class Tropy < ActiveRecord::Base
  validates_uniqueness_of :pageid
  validates_length_of :content, :in => 1..500

  def before_validation_on_create
    self.pageid ||= ActiveSupport::SecureRandom.hex
  end

  def to_param
    pageid
  end
end
