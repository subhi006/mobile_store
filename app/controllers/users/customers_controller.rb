class Users::CustomerController < ApplicationController
  before_action :set_customer, only: [ :show, :edit, :update, :destroy ]
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: "Customer was successfully created."
    else
      flash.now[:alert] = "Failed to create customer. Please check the input."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Customer was successfully updated."
    else
      flash.now[:alert] = "Failed to update customer. Please check the input."
      render :edit
    end
  end

  def destroyed
   if @customer.destroy
    redirect_to customers_path, notice: "Customer was successfully destroyed."
   else
    redirect_to customers_path, alert: "Failed to delete customer."
   end
  end


  private
  def set_customer
    @customer = Customer.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to customers_path, alert: "Customer not found."
  end

  def customer_params
    params.expect(customer: [ :name, :company, :version, :price, :storage ])
  end
end
