class Api::V1::PlayersController < ApplicationController
  def index
    player = Player.all.order(created_at: :desc)
    render json: player
  end

  def create
    player = Player.create!(player_params)
    if player
      render json: player
    else
      render json: player.errors
    end
  end

  private

  def player_params
    params.permit(
      :name,
      :team_id,
      :position_id,
      :rushing_attempts,
      :rushing_attempts_per_game,
      :total_rushing_yards,
      :average_rushing_yards_attempt,
      :rushing_yards_per_game,
      :total_rushing_touchdowns,
      :longest_rush,
      :rushing_first_downs,
      :rushing_first_down_percentage,
      :rushing_twenty_yards,
      :rushing_forty_yards,
      :rushing_fumbles
    )
  end
end
