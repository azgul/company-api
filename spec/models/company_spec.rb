require 'spec_helper'

RSpec.describe Company do
  it 'can create a new company' do
    company = Company.new(name: 'A cool company', cvr: 12345678, address: 'A cool address', city: 'Aarhus', country: 'Denmark', phone: '+45 12 34 56 78')

    company.save!

    saved_company = Company.find(company.id)

    expect(saved_company.name).to eq('A cool company')
    expect(saved_company.cvr).to eq(12345678)
    expect(saved_company.address).to eq('A cool address')
    expect(saved_company.city).to eq('Aarhus')
    expect(saved_company.country).to eq('Denmark')
    expect(saved_company.phone).to eq('+45 12 34 56 78')
  end
end
