class FrasesController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render :json => Frase.all
      end
      format.html {}
    end
  end

  def create
    @frase = Frase.create(params[:frase])
    respond_to do |format|
      format.json do
        render :json => @frase
      end
    end
  end

end
