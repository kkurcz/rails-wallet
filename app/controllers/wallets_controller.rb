class WalletsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @wallets = Wallet.all
  end
end
