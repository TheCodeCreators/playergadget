# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

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
end
