defmodule Aecore.Structures.TxData do
  @moduledoc """
  Aecore structure of a transaction data.
  """

  alias Aecore.Structures.TxData
  @type tx_data() :: %TxData{}

  @doc """
  Definition of Aecore TxData structure

  ## Parameters
  - nonce: A random integer generated on initialisation of a transaction.Must be unique
     - from_acc: From account is the public address of one account originating the transaction
     - to_acc: To account is the public address of the account receiving the transaction
     - value: The amount of a transaction
  """
  defstruct [:nonce, :from_acc, :to_acc, :value, :fee]
  use ExConstructor

  @spec create(binary(), binary(), integer(), integer(), integer()) :: {:ok, %TxData{}}
  def create(from_acc, to_acc, value, nonce, fee) do
    {:ok, %TxData{from_acc: from_acc, to_acc: to_acc, value: value, nonce: nonce, fee: fee}}
  end

  @spec hash_tx(tx_data()) :: binary()
  def hash_tx(tx) do
    :crypto.hash(:sha256, tx)
  end

end
