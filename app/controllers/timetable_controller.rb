class TimetableController < ApplicationController

  def index

  end

  def propose_meeting
    @user = User.find(session[:user])
    @meeting = Meeting.new
  end


  private
  def meeting_params
    params.require(:meeting).permit(:group_involved, :meeting_name, :agenda, :meeting_created_by, :memberID1, :memberID2,:memberID3, :memberID4,:memberID5, :memberID6, :date, :start_time, :end_time, :title)
  end

end
