import Config

config :goons_tracker_bot, GoonsTrackerBot.Scheduler,
	jobs: [
		{"*/30 * * * *", fn -> GoonsTrackerBot.update_location() end}
	]

import_config "#{config_env()}.secret.exs"
