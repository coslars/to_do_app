class Todo < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('planned_complete_date DESC') }
  validates :description, presence: true, length: { maximum: 100 }
  validates_date :planned_complete_date, { allow_nil: true, on_or_after: lambda { Date.current } }
  validates_date :complete_date, { allow_nil: true, on_or_after: lambda { Date.current } }
  validates_numericality_of :user_id, greater_than: 0, allow_blank: false
end
