class Map < ActiveRecord::Base
  PAPER_SIZES = ["a4", "a3", "a2", "a1", "a0"]
  validates_inclusion_of :paper_size, :in => PAPER_SIZES

  ORIENTATIONS = ["landscape", "portrait"]
  validates_inclusion_of :orientation, :in => ORIENTATIONS

  validates_presence_of :title, :left, :right, :top, :bottom

  has_and_belongs_to_many :categories do
    def to_s
      map(&:title).to_sentence
    end
  end

  # Return map bounds in a human readable form
  def bounds
    "#{top},#{left}:#{bottom},#{right}"
  end
end