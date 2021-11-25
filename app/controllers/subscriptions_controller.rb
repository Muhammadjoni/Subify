class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %I[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index

    ActionMailbox::InboundEmail.all.where(status: 'pending').each do |inbound|
      inbound.route
    end
    # Free & Paid Subs
    @subscriptions       = current_user.subscriptions
    @free_subscriptions  = @subscriptions.where(' ? - start_date <= trial', Date.today)
    @on_subscriptions    = @subscriptions.count - @free_subscriptions.count

    # How to compute to total price of All subscriptions ?
    @total_price      = @subscriptions.map(&:price).sum

    # How to compute to total price of Free subscriptions ?
    @total_free_price = @free_subscriptions.map(&:price).sum
    @on_price         = @total_price - @total_free_price

    # SEARCH FORM
    if params[:query].present?
      @subscriptions = grouped_subscriptions(Subscription.search(params[:query]))
    else
      @subscriptions = grouped_subscriptions(@subscriptions)
    end

    @result = @subscriptions.values.map { |group| group.values }.flatten.count

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'subscriptions/list', locals: { subscriptions: @subscripitons }, formats: [:html] }
    end
  end

  def new
    @subscriptions = Subscription.all
    @subscription = Subscription.new
  end

  def show
  end

  def create
    @subscription = Subscription.create(subscription_params)
    @subscription.user = current_user

    if @subscription.save
      SendWhatsappMessage.new(current_user, "Chill Out, I'll take care of the **#{subscripiton.title}** subscription! \n Enjoy! ").call
      redirect_to subscriptions_path, notice: 'Subscription was successfully created.'
    else
      render :new
    end

    # respond_to do |format|

    #   if @subscription.save
    #     message = "The subscription '#{@subscription.title}' was just added to Subify."
    #     SendWhatsappMessage.new(message).call
    #     format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
    #     format.json { render :show, status: :created, location: @subscripiton }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @subscription.errors, status: :unprocessable_entity }
    #   end
    # end
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

  private

  def grouped_subscriptions(subscriptions)
    # grouped subscriptions by category
    grouped_subscriptions = subscriptions.group_by(&:category)

    grouped_subscriptions.transform_values do |value|
      value.group_by { |sub| Date.today - sub.start_date <= sub.trial }
    end
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(
      :title, :username, :sub_type, :notify, :notify_before,
      :notes, :price, :start_date, :end_date, :category, :currency
    )
  end
end
