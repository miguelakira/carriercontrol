class FinancesController < ApplicationController
  before_action :set_finance, only: [:edit]

  def index
    @people = Person.all
    @companies = Company.all
  end

  def edit

  end

  private
  def set_finance
    @finance = Finance.find params[:id]
  end
end
