class User < ActiveRecord::Base

  # t.string  :username, null: false
  # t.string  :email, null: false
  # t.string  :password_hash, null: false
  # t.timestamps null: false

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  has_many :favorites
  has_many :recipes, through: :favorites

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_plain_text_password)
    @password = BCrypt::Password.create(new_plain_text_password)
    self.password_hash = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

end
