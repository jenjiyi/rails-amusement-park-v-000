class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
      if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height 
         "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
      elsif self.user.height < self.attraction.min_height 
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      elsif self.user.tickets < self.attraction.tickets 
        "Sorry. You do not have enough tickets the #{self.attraction.name}."
      else
       ride_ride
     end
  end

  def ride_ride
     self.user.tickets -= self.attraction.tickets
     self.user.nausea += self.attraction.nausea_rating
     self.user.happiness += self.attraction.happiness_rating
     self.user.save
     "Thanks for riding the #{self.attraction.name}!"
  end

  # def nil_values?

  #   [self.user.tickets, self.attraction.tickets, self.user.height, self.attraction.min_height].blank? 
  # end
end
