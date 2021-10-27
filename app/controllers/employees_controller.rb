# frozen_string_literal: true

# Employee Controller
class EmployeesController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    @employees = Employee.limit(limit).offset(params[:offset]).order('created_at DESC')
    render json: @employees
  end

  private

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end
end
