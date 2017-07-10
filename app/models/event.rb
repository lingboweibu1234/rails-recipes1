class Event < ApplicationRecord

 validates_presence_of :name

 before_validation :generate_friendly_id, :on => :create

 has_many :tickets, :dependent => :destroy

 include RankedModel
 ranks :row_order

 def to_param
   self.friendly_id
 end

 protected

 def generate_friendly_id
   self.friendly_id ||= SecureRandom.uuid
 end

end
