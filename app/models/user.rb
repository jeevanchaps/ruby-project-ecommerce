# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  is_admin               :boolean          default(FALSE)
#  is_buyer               :boolean          default(FALSE)
#  is_deactivated         :boolean          default(FALSE)
#  is_seller              :boolean          default(FALSE)
#  name                   :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
has_one_attached :profile_image
  has_many(
    :items,
    class_name: 'Item',
    foreign_key: 'user_id',
    inverse_of: :creator
  )

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  has_many :messages
  validates :user_name, presence: true

  def destroy
        update_attributes(deactivated: true) unless deactivated
  end

  def active_for_authentication?
    super && !is_deactivated
  end

  def inactive_message
    :inactive
  end
  
end
