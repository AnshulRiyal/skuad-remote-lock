require_relative './user_data_formatting_controller'
class PercentFormatController
  def self.read_percent_format_file(file)
    user_array = file.gsub(/\n/, "%").split("%").drop(3)
    parse_percent_file = []

    user_array.each_slice(3) do |user_data|
      data=Hash.new
      data[:first_name] = user_data[0].strip
      data[:city] = user_data[1].strip
      data[:birth_date] = UserDataFormattingController.format_birth_date(user_data[2],"percent")
      parse_percent_file << data
    end
    parse_percent_file
    # Here i have choose to create {Hash} for parsed user, as it would come more handy near future if we need to send same data in json format.
  end
end