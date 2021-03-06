class User < ActiveRecord::Base
  
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides
 
  def mood
    if self.nausea || self.happiness
      unless self.nausea > self.happiness
        'happy'
      else
        'sad'
      end
    else
      ''
    end
  
  end

end
