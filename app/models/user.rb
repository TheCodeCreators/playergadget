# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :steam]

  def name
    "#{first_name} #{last_name}"
  end

  # Setter for name.
  # Receives a name (namely the name gitlab sends us) and puts
  # the first name extracted inside first_name and everything else
  # inside last_name
  # @param name [String]
  def name=(name)
    splitted_name = name.split(' ')
    self.first_name = splitted_name.first
    self.last_name = splitted_name[1..-1].join(' ') if splitted_name.size > 1
  end

  def admin?
    roles.include?(2)
  end

  # Called by OmniauthCallbacksController
  # Finds or updates or creates a user as necessary.
  def self.find_for_oauth(auth)
    # check if user had previously logged on with gitlab
    user = User.find_by(provider: auth.provider, email: auth.info.email)
    return user if user
    registered_user = User.find_by(email: auth.info.email)
    if registered_user
      registered_user.registered_user_found_logic(auth)
    else
      User.new.create_new_user_logic(auth)
    end
  end

  def create_new_user_logic(auth)
    update(name:         auth.extra.raw_info.name,
           provider:     auth.provider,
           email:        auth.info.email,
           password:     Devise.friendly_token[0, 20])
    self
  end

  def registered_user_found_logic(auth)
    assign_attributes(provider:  auth.provider)
    save if changed?
    self
  end
end
