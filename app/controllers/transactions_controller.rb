class TransactionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  def index
    @transactions = Transaction.all
     # @transactions = policy_scope(transaction).order(created_at: :desc)
  end

  def show
  end

  def new
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

    if @transaction.save
      redirect_to root_path, notice: 'transaction was created.'
    else
      render :new
    end
  end

  # PATCH/PUT /walles/1
  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notic: 'transaction was updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'transaction was deleted.'
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
