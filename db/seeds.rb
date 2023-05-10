# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.new
u1.email = 'austinsmith845@example.com'
u1.password='gamer123'
u1.password_confirmation = 'gamer123'
#u1.encrypted_password = '$2a$11$1wyHotsKELPEAJjSO7LJ.eyPRCwV4d.QBiG9TnT2W/SVhBb5s4Mwegame'
u1.name= 'Austin Smith'
u1.user_name="austinsmith845"
u1.is_seller = true

u1.save!

u2 = User.new
u2.email = 'wsmith8@example.com'
u2.password='gamer123'
u2.password_confirmation = 'gamer123'
#u2.encrypted_password = '$2a$11$1wyHotsKELPEAJjSO7LJ.eyPRCwV4d.QBiG9TnT2W/SVhBb5s4Mwegame'
u2.name= 'William Smith'
u2.user_name="wsmith845"
u1.is_seller = true
u2.save!

u3 = User.new
u3.email = 'admin@example.com'
u3.password='admin123'
u3.password_confirmation = 'admin123'
u3.name= 'admin'
u3.user_name="admin"
u3.is_admin = true

u3.save!

u4 = User.new
u4.email = 'buyer@example.com'
u4.password='buyer123'
u4.password_confirmation = 'buyer123'
u4.name= 'buyer'
u4.user_name="buyer"
u4.is_buyer = true

u4.save!

u5 = User.new
u5.email = 'seller@example.com'
u5.password='seller123'
u5.password_confirmation = 'seller123'
u5.name= 'seller'
u5.user_name="seller"
u5.is_seller = true

u5.save!

u6 = User.new
u6.email = 'Bob@example.com'
u6.password='bob123'
u6.password_confirmation = 'bob123'
u6.name= 'Bob'
u6.user_name="Bob"
u6.is_buyer = true

u6.save!

m1 = Message.create!(
    user: u1,
    content: 'This is a test message',
    recipient: 'austinsmith845',
    sender: 'wsmith845',
    is_new: true,
)

i1= Item.create!(
    creator: u1,
    name: 'AcerLaptop',
    description: '8th Gen 4GB DDR4 RAM',
    price: '1200',
    category: "Electronics",
    is_viewable: true,
    is_reported: false
)

i2 = Item.create!(
    creator: u2,
    name: 'HP Laptop',
    description: '8th Gen 8GB DDR4 RAM',
    price: '1300',
    category: "Electronics",
    is_viewable: true, 
    is_reported: false
)

i3 = Item.create!(
    creator: u5,
    name: 'Echo dot',
    description: 'Smart speaker with clock and Alexa',
    price: '400',
    category: "Electronics",
    is_viewable: true,
    is_reported: false
)

i4 = Item.create!(
    creator: u5,
    name: 'Study Desk',
    description: 'Folding Laptop Table for Home',
    price: '100',
    category: "Home",
    is_viewable: true,
    is_reported: false
)

u1.profile_image.attach(io: File.open('app/assets/images/profile.png'), filename: 'profile.png', content_type: 'image/png')
u2.profile_image.attach(io: File.open('app/assets/images/profile.png'), filename: 'profile.png', content_type: 'image/png')
u3.profile_image.attach(io: File.open('app/assets/images/admin.png'), filename: 'admin.png', content_type: 'image/png')
u4.profile_image.attach(io: File.open('app/assets/images/profile.png'), filename: 'profile.png', content_type: 'image/png')
u5.profile_image.attach(io: File.open('app/assets/images/profile.png'), filename: 'profile.png', content_type: 'image/png')

i1.file.attach(io: File.open('app/assets/images/acer-laptop.jpg'), filename: 'acer-laptop.jpg', content_type: 'image/jpg')
i2.file.attach(io: File.open('app/assets/images/acer-laptop.jpg'), filename: 'acer-laptop.jpg', content_type: 'image/jpg')
i3.file.attach(io: File.open('app/assets/images/acer-laptop.jpg'), filename: 'acer-laptop.jpg', content_type: 'image/jpg')