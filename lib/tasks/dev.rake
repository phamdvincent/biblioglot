desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

end

task({ :test => :environment }) do
  p User.where({ "email" => "admin@example.com" }).at(0)
end

task({:restart => :environment }) do
  User.destroy_all
  Language.destroy_all
  Book.destroy_all
  Progress.destroy_all
  Sentence.destroy_all
  WordSentenceLink.destroy_all
  Word.destroy_all
  Definition.destroy_all

  usernames = ["admin", "user"]

  usernames.each do |username|
    user = User.new
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save
  end

  language = Language.new
  language.language_code = "es"
  language.english_name = "spanish"
  language.name = "español"
  language.save

  language.books.create({ title: "El árbol de la ciencia",
                          author: "Pío Baroja",
                          publication_year: "1911"
                        })
  
  language.books.create({ title: "Ganarás el pan...",
                          author: "Pedro Mata",
                          publication_year: "1919"
                          })

end
