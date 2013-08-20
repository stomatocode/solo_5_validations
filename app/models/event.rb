class Event < ActiveRecord::Base


  # Prevent Events from being saved when: 
  # a. The events date is empty, in the past, or is not valid. 
  # b. The events title is already taken or empty. uniqueness, presence
  # c. The event organizers name is empty. presence
  # d. The event organizers email address is invalid. format

  validate :date_valid

  def date_valid
    if self.date < Date.today && self.date.present? && self.date == Date.class

    end
  end

__END__
  validates :organizer_email, format: { with: /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/,
    message: "Please enter a valid email address."}
  validates_uniqueness_of :organizer_email,
    message: "A user with that email has already registered." 



  # validates :organizer_email, {uniqueness: true, message: "Already exists in db."}




# # often nothing in models
# # validations appear here
# # no attr's (provided)
# # ActiveRecord-specific validations go in the model



end