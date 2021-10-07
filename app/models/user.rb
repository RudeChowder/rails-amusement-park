class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def give_tickets(amount)
    self.tickets -= amount
  end

  def mood
    happiness > nausea ? "happy" : "sad"
  end

  def update_happiness(amount)
    self.happiness += amount
  end

  def update_nausea(amount)
    self.nausea += amount
  end
end
