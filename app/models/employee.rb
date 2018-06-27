class Employee < ApplicationRecord
  has_many :subordinates, class_name: 'Employee', foreign_key: :superior_id
  belongs_to :superior, class_name: 'Employee', foreign_key: :superior_id, optional: true

  enum role: [:ceo, :vp, :director, :manager, :sde]

  scope :top_employees, -> {order("salary DESC").limit(10)}

  validates :name, :role, :salary, :rating, presence: true
  validate :sde_as_superior
  validate :ceo_as_top

  before_destroy :assign_reporter

  Employee.roles.each do |role|
    define_method("#{role}?") do
      self.role == role
    end
  end

  #generate hierarchy (Direction: bottom to top).
  def hierarchy
    hierarchy = []
    hierarchy << self
    manager = superior
    while manager
      hierarchy << manager
      manager = manager.superior
    end
    hierarchy
  end

  private
  #validate sde can't be a report of other employee
  def sde_as_superior
    if superior && superior.sde?
      errors.add(:error, "sde can't become a reporter")
    end
  end

  #assing reporter to subordinates
  def assign_reporter
    subordinates.update_all(superior_id: (superior && superior.id || nil))
  end

  def ceo_as_top
    if ceo? && superior
      errors.add(:error, "ceo can't become a reportee")
    end
  end
end
