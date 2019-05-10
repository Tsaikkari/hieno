class Product < ApplicationRecord
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :colour, presence: true
  validates :price, presence: true
  scope :created_desc, -> { order("created_at DESC") }

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_desc.last
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def popular_product
    Product.where(comments.average(:rating) > comments.average(:rating).products.all)
  end

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    Product.next(self.id).first
  end

  def previous
    Product.previous(self.id).first
  end
end



