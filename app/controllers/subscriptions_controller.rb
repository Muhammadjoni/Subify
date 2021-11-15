class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @subscriptions = Subscription.all
  end

  def new
  end

  def show
  end

  def create
    @subscription = Subscription.create(subscription_params)

    if @subscription.save
      redirect_to @subscription, notice: 'subscription was successfully created.'
    else
      render :news
    end
  end

  def edit
  end

  def update
    @subscription.update(subscription_params)
  end

  def destroy
    @subscription.destroy
    redirect_to my_subscriptions_subscriptions_path
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:title, :username, :type, :notify,
                                    :notify_before, :notes, :price, :start_date, :end_date)
  end
end
