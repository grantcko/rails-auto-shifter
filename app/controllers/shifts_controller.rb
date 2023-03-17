class ShiftsController < ApplicationController
  def show
    @shift = Shift.find(params[:id])
    authorize @shift
  end
end
