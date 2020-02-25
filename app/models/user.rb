# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, :last_name, :contact_number, :email, presence: true
  validates :contact_number, uniqueness: true, length: {is: 10}
  validates :email,
            uniqueness: true,
            format:     {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "invalid format"}

  has_and_belongs_to_many :matches
  has_many :user_city_sports
  belongs_to :city
  validates_associated :matches, :user_city_sports

  before_save :titleize_names

  def titleize_names
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end

  protected

  def password_required?
    confirmed? ? super : false
  end
end
