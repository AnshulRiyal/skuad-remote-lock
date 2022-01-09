require_relative './dollor_format_controller'
require_relative './percent_format_controller'
require_relative './user_data_formatting_controller'
class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people_by_dollor = DollorFormatController.read_dollor_format_file(params[:dollar_format])
    people_by_percent = PercentFormatController.read_percent_format_file(params[:percent_format])
    parsed_users = UserDataFormattingController.merge_formatted_file(people_by_dollor, people_by_percent) 
    #Here idea is to use (*arg) for multiple file, if in near future we have more different format of files to parse.
  end

  private

  attr_reader :params
end
