defmodule GoonsTrackerBot.Consumer do
	use Nostrum.Consumer
	alias Nostrum.Api

	def handle_event(_event) do
		:noop
	end
end
