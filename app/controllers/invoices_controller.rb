class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  respond_to :html, :json

  def index
    @invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
    # if @invoice.invoice_items.empty?
    #   @invoice.invoice_items.build
    # end
  end

  # POST /invoices
  # POST /invoices.json
  def create
    customer=params[:invoice].delete :customer_id
    @invoice = Invoice.new(params[:invoice])
    @invoice.customer_id=customer
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def submit_invoice
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      if @invoice.invoice_customer
        format.html { redirect_to invoices_url }
        format.json { render json: @invoice, notice: 'Invoice was successfully submitted.' }
      else
        format.html { redirect_to invoices_url, notice: 'No Invoice Items' }
        format.json { render json: {error: 'No Invoice Items'},status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end
end
