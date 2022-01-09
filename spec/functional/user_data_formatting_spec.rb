require 'spec_helper'
RSpec.describe 'User Data Functional Test' do
  describe 'dollar and percent formats validate correct inforamtion' do
    it 'should return U.S.A if city does not match' do
      expect(UserDataFormattingController.get_full_city_from_initals("LAa")).to eq 'U.S.A'
    end
    it 'should return state regardless initials are lower or upper case ' do
      expect(UserDataFormattingController.get_full_city_from_initals("cO")).to eq 'Colorado'
    end
    it 'should remove leading 0 from date if present' do
      expect(UserDataFormattingController.format_birth_date('03-09-1993','dollor')).to eq '9/3/1993'
    end
  end
end
