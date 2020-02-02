class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_and_belongs_to_many :matches
  has_many :user_city_sports

  # attr_accessor :skip_password_validation

  # def password_match?
  #    self.errors[:password] << I18n.t('errors.messages.blank') if password.blank?
  #    self.errors[:password_confirmation] << I18n.t('errors.messages.blank') if password_confirmation.blank?
  #    self.errors[:password_confirmation] << I18n.translate("errors.messages.confirmation", attribute: "password") if password != password_confirmation
  #    password == password_confirmation && !password.blank?
  # end

  # # new function to set the password without knowing the current 
  # # password used in our confirmation controller. 
  # def attempt_set_password(params)
  #   p = {}
  #   p[:password] = params[:password]
  #   p[:password_confirmation] = params[:password_confirmation]
  #   update_attributes(p)
  # end

  # # new function to return whether a password has been set
  # def has_no_password?
  #   self.encrypted_password.blank?
  # end

  # # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore. 
  # # Instead you should use `pending_any_confirmation`.  
  # def only_if_unconfirmed
  #   pending_any_confirmation {yield}
  # end

  protected

  # def password_required?
  #   return false if skip_password_validation
  #   super
  # end
    def password_required?
      confirmed? ? super : false
    end
end
