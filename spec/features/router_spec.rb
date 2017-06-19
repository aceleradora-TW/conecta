require 'rack/test'
require 'rspec'
require 'spec_helper'

require_relative '../../app/services/router_service.rb'
require_relative '../../app/services/search_service.rb'

RSpec.describe RouterService do

  it "#return_competence" do
    router_service = RouterService.new
    search_service = double("SearchService")

    allow(search_service).to receive(:find_by_competence).with(any_args).and_return({
                                                                         :id => 13,
                                                                         :name => "Escalabilidade (Hardware)",
                                                                         :competence_area_id => 1,
                                                                         :company => "Filep"})

    allow(search_service).to receive(:find_related_competence_institutions).and_return({
                                                                         :id => 13,
                                                                         :name => "Escalabilidade (Hardware)",
                                                                         :competence_area_id => 1,
                                                                         :company => "Filep"})


    sql_value = "Escalabilidade (Hardware)"
    result = router_service.return_competence(sql_value, search_service)
    expect(result.length).not_to eql(0)
  end
end
