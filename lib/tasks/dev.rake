desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  # User.destroy_all
  # Language.destroy_all
  # Book.destroy_all
  # Progress.destroy_all

  # usernames = ["admin", "user"]

  # usernames.each do |username|
  #   user = User.new
  #   user.email = "#{username}@example.com"
  #   user.password = "password"
  #   user.save

  # end

  # language = Language.new
  # language.language_code = "es"
  # language.english_name = "spanish"
  # language.name = "español"
  # language.save

  # book = Book.new
  # book.title = "El árbol de la ciencia".downcase()
  # book.author = "Pío Baroja"
  # book.language_id = 1
  # book.publication_year = "1911"
  # book.save

  # progress = Progress.new
  # progress.user_id = User.where({ "email" => "admin@example.com" }).at(0).id
  # progress.book_id = Book.where({ "title" => "El árbol de la ciencia".downcase() }).at(0).id
  # progress.location = 0
  # progress.progress_percentage = 0
  # progress.save

  # p "There are now #{User.count} users."
  # p "There are now #{Language.count} languages."
  # p "There are now #{Book.count} books."
  # p "There are now #{Progress.count} progresses."
end

task({ :test => :environment }) do
  p User.where({ "email" => "admin@example.com" }).at(0)
end

# task({ :clean_test => :environment}) do
#   Sentence.destroy_all
#   Word.destroy_all
# end
