class UserDataFormattingController

  CITIES = {
    "Alabama"=>"AL", "Alaska"=>"AK", "Arizona"=>"AZ", "Arkansas"=>"AR","California"=>"CA",
    "Colorado"=>"CO", "Connecticut"=>"CT", "Delaware"=>"DE", "District of Columbia"=>"DC",
    "Florida"=>"FL", "Georgia"=>"GA", "Hawaii"=>"HI", "Idaho"=>"ID", "Illinois"=>"IL",
    "Indiana"=>"IN", "Iowa"=>"IA","Kansas"=>"KS", "Kentucky"=>"KY", "Los Angeles"=>"LA",
    "Maine"=>"ME","Maryland"=>"MD", "Massachusetts"=>"MA", "Michigan"=>"MI", "Minnesota"=>"MN",
    "Mississippi"=>"MS", "Missouri"=>"MO", "Montana"=>"MT","Nebraska"=>"NE", "Nevada"=>"NV",
    "New Hampshire"=>"NH", "NewJersey"=>"NJ", "New Mexico"=>"NM", "New York City"=>"NYC",
    "North Carolina"=>"NC", "North Dakota"=>"ND", "Ohio"=>"OH", "Oklahoma"=>"OK",
    "Oregon"=>"OR", "Pennsylvania"=>"PA", "Puerto Rico"=>"PR", "Rhode Island"=>"RI",
    "South Carolina"=>"SC", "South Dakota"=>"SD", "Tennessee"=>"TN", "Texas"=>"TX",
    "Utah"=>"UT", "Vermont"=>"VT", "Virginia"=>"VA", "Washington"=>"WA", "West Virginia"=>"WV",
    "Wisconsin"=>"WI", "Wyoming"=>"WY"
  }
  #Here idea is to find cities from thier initials without using any gem, i opt to create a constant to have my own dictionary..😆

  def self.format_birth_date(birth_date,file_format)
    if file_format == "dollor"
      date = birth_date.split("-").map(&:to_i)
      date[0],date[1] = date[1],date[0]
      return date.join('/')
    end
    if file_format == "percent"
      return birth_date.split("-").map(&:to_i).rotate(1).join('/')
    end
  end

  def self.merge_formatted_file(people_by_dollor, people_by_percent)
    total_user = people_by_dollor+people_by_percent
    sorted_users = sort_user_by_first_name(total_user)
    return sorted_users.flat_map(&:values).each_slice(3).map{|a| a.join(", ")}
  end

  def self.get_full_city_from_initals(city)
    if CITIES.has_value?(city.strip.upcase)
      return CITIES.key(city.strip.upcase)
    end
    return "U.S.A"
  end

  private

  def self.sort_user_by_first_name(users)
    users.sort_by.with_index { |h,i| [h[:first_name], i] }
  end
    
end