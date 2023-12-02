defmodule GoonsTrackerBot do
	alias GoonsTrackerBot.TrackerScraper
	alias Nostrum.Api

	def update_location() do
		{:ok, location} = TrackerScraper.get_current_location()
		Api.update_status(:dnd, "#{location}", 3) # 3 = Watching
	end
end
