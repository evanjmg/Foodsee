
Image.destroy_all 
Restaurant.destroy_all
u1 = User.last


# u1 = User.create(
#  email: "change@me-546915505-instagram.com",
#  encrypted_password: "$2a$10$kVFqRT66Uw3Fof/mM/TprulkJ3mgfpBXX0VRh57n6hkoWB8KnCcEu",
#  reset_password_token: nil,
#  reset_password_sent_at: nil,
#  remember_created_at: nil,
#  sign_in_count: 1,name: "Evan Gillogley",
#  username: "evanjmg",
#  confirmation_token: "ab2e297c20293995c616806a904731d3713dd59038ec82830d043fed873de258", unconfirmed_email: "evanjmg@gmail.com"
# )
i1 = Image.create(url:"http://cdn.bulbagarden.net/upload/thumb/3/39/007Squirtle.png/250px-007Squirtle.png")
i2 = Image.create(url:"http://img3.wikia.nocookie.net/__cb20140903033555/pokemon/images/e/ea/001Bulbasaur_AG_anime.png")
r1 = Restaurant.create(name: "Sweetness Cake Boutique London", rating: 4.3, price_level: 2, category: ["cake", "Boutique"], latitude: 51.506934, longitude: -0.03992 )
r2 = Restaurant.create(name: "Cakes", rating: 4.3, price_level: 2, category: ["cake", "Boutique"], latitude: 51.506934, longitude: -0.03992 )
r2.images << i2 
r2.images << i1
u1.images << i1
u1.images << i2





