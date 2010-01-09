class Tropy < ActiveRecord::Base
  validates_uniqueness_of :pageid

  def before_validation_on_create
    self.pageid ||= ActiveSupport::SecureRandom.hex
  end
end
