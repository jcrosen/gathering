# -*- coding: UTF-8 -*-

class GatheringsController < ApplicationController

  def index
    @rm = ListGathering.new.exec
  end

  def new
    @rm = NewGathering.new.exec
  end

  def create
    @rm = CreateGathering.new(atts: params[:gathering]).exec
    @rm.ok? ? redirect_to(gatherings_path) : render(:new)
  end

  def show
    @rm = ShowGathering.new(id: params[:id]).exec
  end

  def edit
    @rm = EditGathering.new(id: params[:id]).exec
  end

  def update
    @rm = UpdateGathering.new(id: params[:id], atts: params[:gathering]).exec
    @rm.ok? ? redirect_to(gatherings_path) : render(:edit)
  end

  def destroy
    @rm = DestroyGathering.new(id: params[:id]).exec
    redirect_to(gatherings_path)
  end

end
