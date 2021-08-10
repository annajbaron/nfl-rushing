import React from "react";
import { shallow } from "enzyme";
import Players from "components/players";

const test_players = [
	{
		name: "Jonathan Dressler",
		team: {
			name: "Toronto Wolves",
			abbreviation: "TOW",
		},
		position: {
			name: "Manager",
			abbreviation: "MNG",
		},
		rushing_attempts: 7,
		rushing_attempts_per_game: 3,
		total_rushing_yards: 10,
		average_rushing_yards_attempt: 2.5,
		rushing_yards_per_game: 12,
		total_rushing_touchdowns: 0,
		longest_rush: 7,
		rushing_first_downs: 0,
		rushing_first_down_percentage: 0,
		rushing_twenty_yards: 0,
		rushing_forty_yards: 0,
		rushing_fumbles: 0,
	},
	{
		name: "James Rusholme",
		team: {
			name: "Green Bay Packers",
			abbreviation: "GB",
		},
		position: {
			name: "Quarterback",
			abbreviation: "QB",
		},
		rushing_attempts: 13,
		rushing_attempts_per_game: 4,
		total_rushing_yards: 10,
		average_rushing_yards_attempt: 2.7,
		rushing_yards_per_game: 9,
		total_rushing_touchdowns: 0,
		longest_rush: 8,
		rushing_first_downs: 0,
		rushing_first_down_percentage: 0,
		rushing_twenty_yards: 0,
		rushing_forty_yards: 0,
		rushing_fumbles: 1,
	},
	{
		name: "Jacob Pawer",
		team: {
			name: "San Francisco 49ers",
			abbreviation: "SF",
		},
		position: {
			name: "Wide Reciever",
			abbreviation: "WR",
		},
		rushing_attempts: 3,
		rushing_attempts_per_game: 2,
		total_rushing_yards: 12,
		average_rushing_yards_attempt: 3.1,
		rushing_yards_per_game: 5,
		total_rushing_touchdowns: 1,
		longest_rush: 8,
		rushing_first_downs: 1,
		rushing_first_down_percentage: 12,
		rushing_twenty_yards: 0,
		rushing_forty_yards: 1,
		rushing_fumbles: 0,
	},
];

global.fetch = jest.fn(() =>
	Promise.resolve({
		json: () => Promise.resolve({ test_players }),
	})
);

let PlayersComponent;
const initPlayersComponent = () => {
	PlayersComponent = shallow(<Players />);
};

describe("Players", () => {
	beforeEach(() => {
		initPlayersComponent();
	});

	it("Renders without crashing", () => {
		PlayersComponent.unmount();
	});
	it("Contains a table", () => {
		expect(PlayersComponent.find("ReactTable")).toBeTruthy();
	});
});
