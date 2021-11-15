class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %I[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @subscriptions = current_user.subscriptions
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
  end

  def show
    @subscriptions = Subscription.all
  end

  def create
    @subscription = Subscription.create(subscription_params)
    @subscription.user = current_user

    if @subscription.save
      redirect_to @subscription, notice: 'Subscription was successfully created.'
    else
      render :new
    end
  end

  def edit
    @subscription.user = current_user
  end

  def update
    @subscription.update(subscription_params)
    redirect_to @subscription
  end

  def destroy
    @subscription.destroy
    redirect_to subscriptions_path
  end

  # def my_subscriptions
  #   @subscriptions = current_user.subscriptions
  # end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:title, :username, :sub_type, :notify, :notify_before, :notes, :price, :start_date, :end_date, :category, :currency)
  end
end
