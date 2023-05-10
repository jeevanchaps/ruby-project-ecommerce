# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  category    :string
#  description :string
#  is_reported :boolean
#  is_viewable :boolean
#  name        :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_items_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Item < ApplicationRecord
  @@categories = nil 

  has_one_attached :file


    belongs_to(
        :creator,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :items
      )

      def self.categories
        @@categories = ["Antiques", "Art", "Baby", "Books", "Business & Industrial", "Clothing", "Money", "Collectibles", "Electronics" , "Crafts", "Toys", "Motors", "Memorabilia", "Health and Beauty", "Home", "Jewlry", "Music" , "Instruments", "Real Estate", "Services", "Sports", "Guns", "Event Tickets", "Gaming", "Miscellaneous"] 
        @@categories
      end

end
