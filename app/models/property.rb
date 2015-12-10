class Property < ActiveRecord::Base
  belongs_to :user

  def user_name
  	User.find(self.user_id).name
  end

  def buyer_name
    User.find(self.buyer_id).name if self.buyer_id
  end
end
