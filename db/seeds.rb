# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = Category.create([
  { name: "必要" },
  { name: "便利" },
  { name: "楽しむ" }
])

book = Book.create(
  name: "Sample Book"
)

categories.each do |category|
  Budget.create(
    daily: (30000..50000).to_a.sample,
    monthly: (30000..50000).to_a.sample,
    category_id: category.id,
    book_id: book.id
  )

  (1..Time.days_in_month(Date.new(2022, 1, 1).month)).to_a.each do |day|
    Expense.create(
      date: Date.new(2022, 1, day),
      amount: (1000..3000).to_a.sample,
      category_id: category.id,
      book_id: book.id
    )
  end
end
