class Article < ApplicationRecord
  belongs_to :source
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :newsletters
  has_rich_text :content
end
