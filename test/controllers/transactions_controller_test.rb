require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test 'should get index' do
    get transactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_transaction_url
    assert_response :success
  end

  test 'should create transaction' do
    assert_difference('Transaction.count') do
<<<<<<< HEAD
      post transactions_url,
           params: { transaction: { amount: @transaction.amount, date: @transaction.date, name: @transaction.name } }
=======
      # rubocop:disable Layout/LineLength
      post transactions_url, params: { transaction: { amount: @transaction.amount, date: @transaction.date, name: @transaction.name } }
      # rubocop:enable Layout/LineLength
>>>>>>> cf14afac38958bbf592fc42ec288d295b8c08d7c
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test 'should show transaction' do
    get transaction_url(@transaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test 'should update transaction' do
<<<<<<< HEAD
    patch transaction_url(@transaction),
          params: { transaction: { amount: @transaction.amount, date: @transaction.date, name: @transaction.name } }
=======
    # rubocop:disable Layout/LineLength
    patch transaction_url(@transaction), params: { transaction: { amount: @transaction.amount, date: @transaction.date, name: @transaction.name } }
    # rubocop:enable Layout/LineLength
>>>>>>> cf14afac38958bbf592fc42ec288d295b8c08d7c
    assert_redirected_to transaction_url(@transaction)
  end

  test 'should destroy transaction' do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
