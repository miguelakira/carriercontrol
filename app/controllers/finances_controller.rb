class FinancesController < ApplicationController
  before_action :set_finance_and_client, only: [:edit]

  def index
    @people = Person.all
    @companies = Company.all
  end

  def edit
    @payment = @finance.payments.build
  end

  def update
    raise params.inspect
  end

  private
  def set_finance_and_client
    @finance = Finance.find params[:id]
    @client = @finance.client
  end
end
