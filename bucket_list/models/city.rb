class City

  attr_reader :id, :country_id
  attr_accessor :name, visit, attractions

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @country_id = details['country_id']
    @visit = details['visit']
    @attractions = []
  end

end
