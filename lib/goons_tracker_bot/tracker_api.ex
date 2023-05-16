defmodule GoonsTrackerBot.TrackerApi do
	@url "https://congested-valleygirl-9254455.herokuapp.com/goonDetectors/current"

	def get_current() do
		case HTTPoison.get(@url) do
			{:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
				%{"lastReported" => last_reported, "location" => location} = body |> Jason.decode!()
				{:ok, %{last_reported: last_reported, location: location}}

			{:ok, %HTTPoison.Response{status_code: status}} ->
				{:error, "Error: status " <> status}

			{:error, %HTTPoison.Error{reason: reason}} ->
				{:error, reason}
		end
	end
end
