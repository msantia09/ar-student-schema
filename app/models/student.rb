require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

	validates :email, :format => { :with => /[a-z]*@[a-z]*.[a-z]{2,}/}
	validates :email, :uniqueness => true
	validates :age, :numericality => { :greater_than => 5}
	validates :phone, :format => {:with => /\D\d{3}\D{2}\d{3}\D\d{4}\D{2}\d{4}/}
	def name
		name = self.first_name + " " + self.last_name
	end

	def age
		today = (Date.today)
		age = today.year - self.birthday.year
	end
end
