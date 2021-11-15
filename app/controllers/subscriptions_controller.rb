class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
    authorize @subscription
  end

  def create
    @subscription = Subscription.create(subscription_params)
    @subscription.user = current_user
    authorize @subscription

    if @subscription.save
      redirect_to @subscription, notice: 'subscription was successfully created.'
    else
      render :news
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :username, :type, :notify, :notes,
                                        :notify_before, :price, :start_date, :end_date)
  end
end
