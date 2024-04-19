# frozen_string_literal: true

# Given a CSV string of doctors,
# return the npis for doctors that can sign digitally.

# Sample Input:
# npi,first_name,last_name,email,sign_digitally
# 1111111111,Bess,Rollitt,brollitt0@gov.uk,true
# 2222222222,Catriona,Pollicote,cpollicote1@ask.com,false

# Expected Output:
# ["1111111111"]

# Your goal is to make can_sign_digitally return an array of
# npis for doctors that can sign digitally.

# We care about
# * communication
# * code clarity
# * testing

# Doctors
class Doctors
  require('csv')

  def initialize(data)
    @data = data
  end

  def can_sign_digitally
    csv = CSV.read(@data)
    csv.parse(headers: true)
    can_sign = []
    csv.each do |row|
      can_sign << row['npi'] if row['sign_digitally'] == 'true'
    end

    can_sign
  end
end
