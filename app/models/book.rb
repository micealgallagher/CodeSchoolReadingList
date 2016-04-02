class Book < ActiveRecord::Base

	has_many :book_genres
	has_many :genres, through: :book_genres

	scope :finished, -> { where.not(finished_on: nil) }
	scope :recent,   -> { where('finished_on > ?', 2.days.ago) }
	scope :search,   -> (keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present }

	def finished?
		finished_on.present?
	end
end
