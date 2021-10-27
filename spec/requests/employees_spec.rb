# frozen_string_literal: true

require 'rails_helper'

describe 'Employees API', type: :request do
  describe 'GET /employees' do
    before do
      @first_employee = FactoryBot.create(:employee, fullname: 'Bobby Jenkins',
                                                     identification_number: 1)
      @second_employee = FactoryBot.create(:employee, fullname: 'Jobby Benkins',
                                                      identification_number: 2)
    end

    it 'returns all employees in the correct order' do
      get '/employees'

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(2)
      expect(response_body[0]['fullname']).to eq(@second_employee.fullname)
      expect(response_body[0]['identification_number']).to eq(@second_employee.identification_number)
      expect(response_body[1]['fullname']).to eq(@first_employee.fullname)
      expect(response_body[1]['identification_number']).to eq(@first_employee.identification_number)
    end

    it 'returns a subset of most recent employees based on limit' do
      get '/employees', params: { limit: 1 }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body[0]['fullname']).to eq(@second_employee.fullname)
      expect(response_body[0]['identification_number']).to eq(@second_employee.identification_number)
    end

    it 'returns a subset of employees based on limit and offset' do
      get '/employees', params: { limit: 1, offset: 1 }
      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body[0]['fullname']).to eq(@first_employee.fullname)
      expect(response_body[0]['identification_number']).to eq(@first_employee.identification_number)
    end
  end
end
