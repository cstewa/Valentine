class Message < ActiveRecord::Base
  attr_accessible :message, :receiver_email, :user_id

  belongs_to :user
end
