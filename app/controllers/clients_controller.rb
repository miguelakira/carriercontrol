class ClientsController < ApplicationController
  def find_by_document
    client = if params[:cpf]
      Person.find_by(cpf: params[:cpf])
    else
      Company.find_by(cnpj: params[:cnpj])
    end

    render json: client
  end
end
