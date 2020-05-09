defmodule  Gencounter.Consumer do
  use Genstage

  def start_link do
    GenStage.start_link(__MODULE__, :state)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [Gencounter.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect {self(), event, state}
    end

    {:noprely, [], state}
  end
end
