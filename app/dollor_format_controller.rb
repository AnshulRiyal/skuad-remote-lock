require_relative './user_data_formatting_controller'
class DollorFormatController
  def self.read_dollor_format_file(file)
    user_array = file.gsub(/\n/, "$").split("$").drop(4)    
    parse_dollor_file = []
    
    user_array.each_slice(4) do |user_data|
      data=Hash.new
      data[:first_name] = user_data[3].strip
      data[:city] = UserDataFormattingController.get_full_city_from_initals(user_data[0])
      data[:birth_date] = UserDataFormattingController.format_birth_date(user_data[1],"dollor")
      parse_dollor_file << data
    end
    return parse_dollor_file
  end

  # Here i have choose to create {Hash} for parsed user, as it would come more handy near future if we need to send same data in json format.

end