class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]
  before_action :require_login

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
    @owntransactions = Transaction.where(user: current_user).order(date: :desc)
  end

  def external_index
    @owntransactions = Transaction.where(user: current_user).order(date: :desc)
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @groups = Group.all
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params.merge(user_id: current_user.id))
    @transaction.groups << Group.where(id: params[:transaction][:group_ids])
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :amount, :date, :group_ids)
  end
end
