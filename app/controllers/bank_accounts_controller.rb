class BankAccountsController < ApplicationController
  before_action :set_account, only:[:show, :edit, :update, :destroy]

  def index
    @bank_accounts = current_user.bank_accounts
  end

  def show
  end

  def new
    @bank_account = current_user.bank_account.new
  end

  def edit
  end

  def create
    @bank_account = current_user.bank_accounts.new(account_params)
    if @bank_account.save
      redirect_to @bank_account, notice: 'Account created'
    else 
      render :new
    end
  end

  def update
    if @bank_account.update(account_params)
      redirect_to @bank_account, notice: 'Account updated'
    else 
      render :edit
    end
  end

  def destroy
    @bank_account.destroy
    redirect_to bank_accounts_path, notice: 'Accout deleted'
  end

  private

  def set_account
    @bank_account = current_user.bank_accounts.find(params[:id])
  end

  def account_params
    params.require(:bank_account).permit(:title, :institution, :amount, :description, :active)
  end

end
