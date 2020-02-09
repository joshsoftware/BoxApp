# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_and_belongs_to_many :matches
  has_many :user_city_sports

  protected

  def password_required?
    confirmed? ? super : false
  end
end
