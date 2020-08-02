require 'rails_helper'

RSpec.describe RoomsController, type: :request do
  describe 'GET #listing' do
    before do
      get listing_room_path(existing)
    end
  end
end
