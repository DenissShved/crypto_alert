class AlertsController < ApplicationController
  before_action :set_alert, only: %i[ show edit update destroy ]
  before_action :set_user

  # GET /alerts or /alerts.json
  def index
    @alerts = Alert.all
  end

  # GET /alerts/1 or /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  def current_price
    coin = params[:symbol]
    price = Fetcher.get_price(coin)
    render json: { price: price }
  end

  # POST /alerts or /alerts.json
  def create
    @alert = Alert.new(alert_params.merge(user_id: @user.id))

    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: "Alert was successfully created." }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1 or /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to @alert, notice: "Alert was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @alert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1 or /alerts/1.json
  def destroy
    @alert.destroy!

    respond_to do |format|
      format.html { redirect_to alerts_path, notice: "Alert was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def alert_params
      params.expect(alert: [ :coin, :condition, :target_price ])
    end

    # TODO: For the perpose of the task using only one user. The one generated
    def set_user
      @user = User.last
    end
end
