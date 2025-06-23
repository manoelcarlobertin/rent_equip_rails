class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.order(:name)
    authorize @customers
  end

  def search
    @customers = Customer.search_by_name(params[:q])
    render layout: false
  end

  def show
    authorize @customer
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    # authorize @customer

    if @customer.save
      redirect_to customers_path, notice: t('customers.create.success')
    else
      flash.now[:alert] = t('customers.create.error')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @customer
  end

  def update
    authorize @customer

    if @customer.update(customer_params)
      redirect_to @customer, notice: t('customers.update.success')
    else
      flash.now[:alert] = t('customers.update.error')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @customer

    if @customer.destroy
      redirect_to customers_path, notice: t('customers.destroy.success')
    else
      redirect_to customers_path, alert: t('customers.destroy.error')
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :dob, :mobile_phone, :email)
  end

  def load_customer
    @customer = Customer.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to customers_path, alert: t('customers.not_found')
  end
end
