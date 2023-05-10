# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :string
#  is_new     :boolean
#  recipient  :string
#  sender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
    validates :sender, presence: true
    validates :recipient, presence: true
    belongs_to :user

end
