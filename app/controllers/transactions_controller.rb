class TransactionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  def index
    @transactions = Transaction.all
  end

  def show
  # maybe use for later
  end

  def new
    # @wallets is only needed for frontend simple_form transfers ui
    @wallets = Wallet.all
    @wallet = Wallet.find(params[:wallet_id])
    @transaction = Transaction.new
    authorize @transaction
  end

  # GET /transaction/1/edit
  def edit
  end

  # POST /transactions
  def create
    # raise
    @transaction = Transaction.new(transaction_params)
    @wallet = Wallet.find(params[:wallet_id])
    @transaction.sender_wallet = @wallet
    authorize @transaction
    if @transaction.funds_sufficient? && @transaction.save
      @transaction.update_balance
      redirect_to root_path, notice: 'transaction was created.'
    else
      flash[:alert] = "Please check that you have sufficient funds in this wallet and all information is correct."
      render :new
    end
  end

  private
  def set_transaction
    @transaction = transaction.find(params[:id])
    authorize @transaction
  end

  def transaction_params
    params.require(:transaction).permit(:activity, :amount, :purpose, :receiver_wallet_id)
  end
end
