import Config

config :goons_tracker_bot, GoonsTrackerBot.Scheduler,
	jobs: [
		update_location: [
			schedule: "*/30 * * * *",
			task: {GoonsTrackerBot, :update_location, []},
		],
	]

import_config "#{config_env()}.secret.exs"
