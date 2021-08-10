import React from "react";
import { Link } from "react-router-dom";
import "react-dropdown/style.css";
import "react-table-6/react-table.css";
import ReactTable from "react-table-6";
import { CSVLink, CSVDownload } from "react-csv";
import { isEmpty } from "lodash";

const columns = [
    {
        Header: "Name",
        accessor: "name",
    },
    {
        Header: "Team ID",
        accessor: "team_id",
    },
    {
        Header: "Position ID",
        accessor: "position_id",
    },
    {
        Header: "Rushing Attempts",
        accessor: "rushing_attempts",
    },
    {
        Header: "Rushing Attempts Per Game",
        accessor: "rushing_attempts_per_game",
    },
    {
        Header: "Total Rushing Yards",
        accessor: "total_rushing_yards",
    },
    {
        Header: "Average Rushing Yard Attempt",
        accessor: "average_rushing_yards_attempt",
    },
    {
        Header: "Rushing Yards Per Game",
        accessor: "rushing_yards_per_game",
    },
    {
        Header: "Total Rushing Touchdowns",
        accessor: "total_rushing_touchdowns",
    },
    {
        Header: "Longest Rush",
        accessor: "longest_rush",
    },
    {
        Header: "Rushing First Downs",
        accessor: "rushing_first_downs",
    },
    {
        Header: "Rushing First Down Percentage",
        accessor: "rushing_first_down_percentage",
    },
    {
        Header: "Rushing 20+ Yards",
        accessor: "rushing_twenty_yards",
    },
    {
        Header: "Rushing 40+ Yards",
        accessor: "rushing_forty_yards",
    },
    {
        Header: "Rushing Fumbles",
        accessor: "rushing_fumbles",
    },
];

class Players extends React.Component {
    constructor(props) {
        super(props);
        this.download = this.download.bind(this);
        this.state = {
            tableProperties: {
                allData: [],
            },
            dataToDownload: [
                [
                    "Name",
                    "Team ID",
                    "Position ID",
                    "Rushing attempts",
                    "Rushing Attempts Per Game",
                    "Total Rushing Yards",
                    "Average Rushing Yards Attempt",
                    "Rushing Yards Per Game",
                    "Total Rushing Touchdowns",
                    "Longest Rush",
                    "Rushing First Downs",
                    "Rushing First Down Percentage",
                    "Rushing 20+ Yards",
                    "Rushing 40+ Yards",
                    "Rushing Fumbles",
                ],
            ],
        };
    }

    componentDidMount() {
        const url = "/api/v1/players/index";
        fetch(url)
            .then((response) => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then((response) =>
                this.setState({ tableProperties: { allData: response } })
            )
            .catch(() => this.props.history.push("/"));
    }

    download() {
        const currentRecords = this.reactTable.getResolvedState().sortedData;

        var data_to_download = this.state.dataToDownload;
        const keys = [
            "name",
            "team_id",
            "position_id",
            "rushing_attempts",
            "rushing_attempts_per_game",
            "total_rushing_yards",
            "average_rushing_yards_attempt",
            "rushing_yards_per_game",
            "total_rushing_touchdowns",
            "longest_rush",
            "rushing_first_downs",
            "rushing_first_down_percentage",
            "rushing_twenty_yards",
            "rushing_forty_yards",
            "rushing_fumbles",
        ];

        currentRecords.forEach((filtered_player) => {
            let ordered_array = keys.map((key) => {
                return filtered_player[key];
            });
            data_to_download.push(ordered_array);
        });
        this.setState({ dataToDownload: data_to_download });
    }

    render() {
        return (
            <div>
                <CSVLink
                    data={this.state.dataToDownload}
                    target="_blank"
                    filename="data.csv"
                    onClick={(event, done) => {
                        this.download().then(() => {
                            done();
                        });
                    }}
                >
                    Download CSV
                </CSVLink>
                <div>
                    <ReactTable
                        ref={(r) => (this.reactTable = r)}
                        data={this.state.tableProperties.allData}
                        columns={columns}
                        filterable
                        defaultFilterMethod={(filter, row) =>
                            String(row[filter.id])
                                .toLowerCase()
                                .includes(filter.value.toLowerCase())
                        }
                    />
                </div>
            </div>
        );
    }
}

export default Players;
