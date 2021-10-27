# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  it 'has a max limit of 100' do
    expect(Employee).to receive(:limit).with(100).and_call_original

    get :index, params: { limit: 999 }
  end
end
