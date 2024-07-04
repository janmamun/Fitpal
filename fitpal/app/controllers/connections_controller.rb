class ConnectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @connections = current_user.connections
  end

  def create
    @connection = current_user.connections.build(partner_id: params[:partner_id])
    if @connection.save
      redirect_to user_path(params[:partner_id]), notice: 'Connection request sent.'
    else
      redirect_to user_path(params[:partner_id]), alert: 'Unable to send connection request.'
    end
  end

  def destroy
    @connection = current_user.connections.find(params[:id])
    @connection.destroy
    redirect_to user_path(@connection.partner_id), notice: 'Connection removed.'
  end
end
