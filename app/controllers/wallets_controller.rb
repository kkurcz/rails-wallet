class WalletsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_wallet, only: [:show, :edit, :update, :destroy]
  def index
    # @wallets = Wallet.all
    @wallets = policy_scope(Wallet).order(created_at: :desc)
  end

  def show
    @transactions = policy_scope(Transaction).where(sender_wallet: @wallet.id).order(created_at: :desc)
  end

  def new
    @wallet = Wallet.new
    authorize @wallet
  end

  # GET /wallet/1/edit
  def edit
  end

  # POST /wallets
  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = current_user
    authorize @wallet

    if @wallet.save
      redirect_to @wallet, notice: 'Wallet was created.'
    else
      render :new
    end
  end

  # PATCH/PUT /walles/1
  def update
    if @wallet.update(wallet_params)
      redirect_to @wallet, notic: 'Wallet was updated.'
    else
      render :edit
    end
  end

  def destroy
    @wallet.destroy
    redirect_to wallets_url, notice: 'Wallet was deleted.'
  end

  private
  def set_wallet
    @wallet = Wallet.find(params[:id])
    authorize @wallet
  end

  def wallet_params
    params.require(:wallet).permit(:name)
  end
end
