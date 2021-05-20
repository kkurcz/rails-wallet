class WalletsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @wallets = Wallet.all
  end

  def show
  end

  def new
    @wallet = Wallet.new
  end

  def edit
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = current_user

    if @wallet.save
      redirect_to @wallet, notice: 'Wallet was created.'
    else
      render: new
    end
  end

  def update
  end

  def destroy
  end
end
