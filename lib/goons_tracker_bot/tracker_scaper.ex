defmodule GoonsTrackerBot.TrackerScraper do
	@url "https:\/\/docs.google.com\/spreadsheets\/d\/e\/2PACX-1vRwLysnh2Tf7h2yHBc_bpZLQh6DiFZtDqyhHLYP022xolQUPUHkSModV31E5Y7cLh_8LZGexpXy2VuH\/pubhtml\/sheet?headers\x3dfalse&gid=1420050773"

	def current_location() do
		case HTTPoison.get(@url) do
			{:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
				{:ok, document} = Floki.parse_document(body)

				location = document
				|> Floki.find(".waffle tr:nth-child(2) td:first-of-type")
				|> Floki.text()

				{:ok, location}

			{:ok, %HTTPoison.Response{status_code: status}} ->
				{:error, "Error: status " <> Integer.to_string(status)}

			{:error, %HTTPoison.Error{reason: reason}} ->
				{:error, reason}
		end
	end
end
