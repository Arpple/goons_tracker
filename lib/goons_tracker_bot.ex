defmodule GoonsTrackerBot do
	alias GoonsTrackerBot.TrackerApi
	alias Nostrum.Api

	def update_location() do
		{:ok, res} = TrackerApi.get_current()
		Api.update_status(:dnd, "#{res.location}", 3) # 3 = Watching
	end
end
