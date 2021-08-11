# ruby encoding: utf-8
require 'json'


# ----- Import and create players, teams and positions from rushing.json ----- #
file = File.read(File.join(__dir__, '.././public/rushing.json'))
data_hash = JSON.parse(file)
positions = {
	QB: "Quarterback", 
	RB: "Running Back", 
	FB: "Fullback", 
	WR: "Wide Receiver", 
	TE: "Tight End", 
	OL: "Offensive Lineman", 
	C: "Center", 
	G: "Guard", 
	LG: "Left Guard", 
	RG: "Right Guard", 
	T: "Tackle", 
	LT: "Left Tackle", 
	RT: "Right Tackle", 
	K: "Kicker", 
	KR: "Kick Returner", 
	DL: "Defensive Lineman", 
	DE: "Defensive End", 
	DT: "Defensive Tackle", 
	NT: "Nose Tackle", 
	LB: "Linebacker", 
	ILB: "Inside Linebacker", 
	OLB: "Outside Linebacker", 
	MLB: "Middle Linebacker", 
	DB: "Defensive Back", 
	CB: "Cornerback", 
	FS: "Free Safety", 
	SS: "Strong Safety", 
	S: "Safety", 
	P: "Punter", 
	PR: "Punt Returner"
}
teams = {
	ARI: "Arizona Cardinals",
	ATL: "Atlanta Falcons",
	BAL: "Baltimore Ravens",
	BUF: "Buffalo Bills",
	CAR: "Carolina Panthers",
	CHI: "Chicago Bears",
	CIN: "Cincinnati Bengals",
	CLE: "Cleveland Browns",
	DAL: "Dallas Cowboys",
	DEN: "Denver Broncos",
	DET: "Detroit Lions",
	GB: "Green Bay Packers",
	HOU: "Houston Texans",
	IND: "Indianapolis Colts",
	JAX: "Jacksonville Jaguars",
	KC: "Kansas City Chiefs",
	LV: "Las Vegas Raiders",
	LAC: "Los Angeles Chargers",
	LA: "Los Angeles Rams",
	MIA: "Miami Dolphins",
	MIN: "Minnesota Vikings",
	NE: "New England Patriots",
	NO: "New Orleans Saints",
	NYG: "New York Giants",
	NYJ: "New York Jets",
	OAK: 'Oakland Raiders',
	PHI: "Philadelphia Eagles",
	PIT: "Pittsburgh Steelers",
	SD: "San Diego Chargers",
	SF: "San Francisco 49ers",
	SEA: "Seattle Seahawks",
	TB: "Tampa Bay Buccaneers",
	TEN: "Tennessee Titans",
	WAS: "Washington Football Team"
}
p 'Beginning data population'

counter = 0
data_hash.each do |item|
	player_team = Team.where('abbreviation = ? or name = ?', item["Team"], teams[item["Team"].to_sym]).first_or_create(abbreviation: item["Team"], name: teams[item["Team"].to_sym])
	player_position = Position.where('abbreviation = ? or name = ?', item["Pos"], positions[item["Pos"].to_sym]).first_or_create(abbreviation: item["Pos"], name: positions[item["Pos"].to_sym])
	Player.create!(
		name: item["Player"], 
		team_id: player_team.id, 
		position_id: player_position.id, 
		rushing_attempts: item["Att"],
		rushing_attempts_per_game: item["Att/G"],
		total_rushing_yards: item["Yds"],
		average_rushing_yards_attempt: item["Avg"],
		rushing_yards_per_game: item["Yds/G"],
		total_rushing_touchdowns: item["TD"],
		longest_rush: item["Lng"],
		rushing_first_downs: item["1st"],
		rushing_first_down_percentage: item["1st%"],
		rushing_twenty_yards: item["20+"],
		rushing_forty_yards: item["40+"],
		rushing_fumbles: item["FUM"]
	)
	counter += 1
end

p "#{counter} players have been created"