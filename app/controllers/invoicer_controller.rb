class InvoicerController < ApplicationController
  helper 'joosy/sprockets'

  def index
    render nothing: true, layout: 'invoicer'
  end
end
