class FrasesController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render :json => Frase.all
      end
      format.html {}
    end
  end

end
