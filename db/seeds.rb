# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customer_1 = Customer.create(first_name: "Tea", last_name: "Tree", email: "tea@teatree.com", address: "123 Main St, New York, NY 10101")
tea_1 = Tea.create(:title=>"Bael Fruit", :description=>"Quae accusamus quia laudantium.", :temperature=>212, :brew_time=>242)
tea_2 = Tea.create(:title=>"Kapor", :description=>"Culpa tenetur nihil ipsum.", :temperature=>175, :brew_time=>299)
subscription_1 = Subscription.create(:title=>"Premium", :price=>5.99, :status=>0, :frequency=>3, :tea_id=>tea_1.id, customer_id: customer_1.id)
subscription_2 = Subscription.create(:title=>"Premium", :price=>5.99, :status=>1, :frequency=>2, :tea_id=>tea_2.id, customer_id: customer_1.id)
