# == Schema Information
#
# Table name: languages
#
#  id            :integer          not null, primary key
#  english_name  :string
#  language_code :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Language < ApplicationRecord
end
