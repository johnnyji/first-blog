# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..100).each do |i|
  Article.create!(title: "Lipsum Post #{i}", body: %{
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt ipsam id praesentium. Optio ipsa quas quisquam deserunt facere quaerat quis omnis quod fugit distinctio! Debitis, illo. Rerum, pariatur ipsum libero.
    })
end