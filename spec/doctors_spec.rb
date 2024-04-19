# frozen_string_literal: true

require_relative '../doctors'
require 'rspec'

RSpec.describe Doctors do
  let :empty_data do
    <<~STR
      npi,first_name,last_name,email,sign_digitally
    STR
  end

  let :mixed_data do
    <<~STR
      npi,first_name,last_name,email,sign_digitally
      3333333333,John,Doe,jdoe@example.com,true
      4444444444,Jane,Doe,jdoe2@example.com,false
      5555555555,Jim,Doe,jdoe3@example.com,true
    STR
  end

  it 'returns an empty array when no doctors can sign digitally' do
    expect(described_class.new(empty_data).can_sign_digitally).to eq([])
  end

  it 'returns correct NPIs when some doctors can sign digitally' do
    expect(described_class.new(mixed_data).can_sign_digitally).to eq(%w[3333333333 5555555555])
  end

  it 'returns NPIs when some doctors can sign digitally' do
    expect(described_class.new('files/doctors.csv').can_sign_digitally).to eq([])
  end
end
