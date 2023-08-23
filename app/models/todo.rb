class Todo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :tags, type: Array
  field :status, type: String
  validates :status, inclusion: { in: %w(yet_to_start in_progress completed) }
  
end
