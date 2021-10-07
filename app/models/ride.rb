class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets? && tall_enough?
      send_user_on_ride
    else
      message = "Sorry."
      message = "#{message} You do not have enough tickets to ride the Roller Coaster." unless enough_tickets?
      message = "#{message} You are not tall enough to ride the Roller Coaster." unless tall_enough?
      message
    end
  end

private

  def enough_tickets?
    user.tickets > attraction.tickets
  end

  def tall_enough?
    user.height > attraction.min_height
  end

  def send_user_on_ride
    user.give_tickets(attraction.tickets)
    user.update_nausea(attraction.nausea_rating)
    user.update_happiness(attraction.happiness_rating)
    user.save
  end
end
