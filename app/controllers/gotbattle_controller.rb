class GotbattleController < ApplicationController
  def index
    @records = Gotbattle.count
  end

  def search
    term = params[:term]
    battles = Gotbattle.search(term)
    render :json => battles.to_json
  end

  def list_ui
    term = params[:term]
    @battle_list = Gotbattle.list_battles(term)
    render partial: 'battle_list'
  end

  def list
    term = params[:term]
    @battle_list = Gotbattle.list_battles(term)
    render :json => @battle_list.to_json
  end

  def count
    term = params[:term]
    @battle_list = {}
    @battle_list["count"] = Gotbattle.list_battles(term).count
    render :json => @battle_list.to_json
  end

  def stats
    statics = {"most_active" => {}, "attacker_outcome" => {}, "battle_type" => [], "defender_size" => {}}
    active_attacker = Gotbattle.group(:attacker_king).where.not(attacker_king: nil).order("count_id DESC").count(:id).keys[0] 
    active_defender = Gotbattle.group(:defender_king).where.not(defender_king: nil).order("count_id DESC").count(:id).keys[0]  
    active_region = Gotbattle.group(:region).where.not(region: nil).order("count_id DESC").count(:id).keys[0]  
    win = Gotbattle.where(attacker_outcome: "win").count
    loss = Gotbattle.where(attacker_outcome: "loss").count
    battle_type = Gotbattle.where.not(bettle_type:nil).pluck(:bettle_type).uniq
    average_defender = Gotbattle.average(:defender_size).to_f.round(3)
    min_defender = Gotbattle.minimum(:defender_size)
    max_defender = Gotbattle.maximum(:defender_size)
    statics["most_active"]["attacker_king"] = active_attacker
    statics["most_active"]["defender_king"] = active_defender
    statics["most_active"]["region"] = active_region
    statics["most_active"]["name"] = ""
    statics["attacker_outcome"]["win"] = win
    statics["attacker_outcome"]["loss"] = loss
    statics["battle_type"] = battle_type
    statics["defender_size"]["average"] = average_defender
    statics["defender_size"]["min"] = min_defender
    statics["defender_size"]["max"] = max_defender
    render :json => statics.to_json
  end
end
