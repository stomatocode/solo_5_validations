class Event < ActiveRecord::Base


  # Prevent Events from being saved when: 
  # a. The events date is empty, in the past, or is not valid. 
  # b. The events title is already taken or empty. uniqueness, presence
  # c. The event organizers name is empty. presence
  # d. The event organizers email address is invalid. format

  validate :date_valid

  def date_valid
    puts '*'*50
    puts date
    if self.date && self.date < Date.today
      errors.add(:date, "Date must be present and can't be in the past")
    end
  end

  validates :date, presence: true
  validates :organizer_email, format: { with: /[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i,
    message: "Please enter a valid email address."}
  validates :organizer_email, uniqueness: true
    # message: "A user with that email has already registered." 



  # validates :organizer_email, {uniqueness: true, message: "Already exists in db."}




# # often nothing in models
# # validations appear here
# # no attr's (provided)
# # ActiveRecord-specific validations go in the model



end