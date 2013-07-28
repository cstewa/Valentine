class User < ActiveRecord::Base

  authenticates_with_sorcery!

  attr_accessible :about_me, :age, :email, :first_name, :gender, :location, :password, :password_confirmation, :stripe_id

  has_many :photos
  has_many :messages

  validates :email, :uniqueness => true
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password


def customer_emails
  customer_emails = []
  Stripe::Customer.all.data.each do |c|
    customer_emails << c.email
  end
  customer_emails
end

def is_paid
  customer_emails.include?(self.email)
end


end