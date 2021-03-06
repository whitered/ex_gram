defmodule Examples.Simple do
  @bot :simple_bot
  def bot(), do: @bot

  use ExGram.Bot, name: @bot

  command("echo")

  middleware(ExGram.Middleware.IgnoreUsername)

  require Logger

  def handle({:command, :echo, %{text: t}}, cnt) do
    cnt |> answer(t)
  end

  def handle({:bot_message, from, msg}, %{name: name}) do
    Logger.info("Message from bot #{inspect(from)} to #{inspect(name)}  : #{inspect(msg)}")
    :hi
  end

  def handle(msg, _) do
    IO.puts("Unknown message #{inspect(msg)}")
  end
end
