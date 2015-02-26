class MeetingsController < ApplicationController


  def index
    @user = User.find(session[:user])
    @meetings = Meeting.where("meeting_created_by = ? OR memberID1 = ? OR memberID2 = ? OR memberID3 = ? OR memberID4 = ? OR memberID5 = ? OR memberID6 = ?", @user.username,@user.username,@user.username,@user.username,@user.username,@user.username,@user.username)
  end

  def new
    @times = {9 => '09:00', 10 => '10:00' , 11 => '11:00',12 => '12:00',1 => '13:00', 2 =>'14:00',3 => '15:00', 4 => '16:00',5 => '17:00'}
    @meeting = Meeting.new
  end

  def create
    @times = {9 => '09:00', 10 => '10:00' , 11 => '11:00',12 => '12:00',1 => '13:00', 2 =>'14:00',3 => '15:00', 4 => '16:00',5 => '17:00'}

    @meeting = Meeting.new(meeting_params)
    #Redirect to root url with success message if created, otherwise render new
    if @meeting.valid? && @meeting.save!
      redirect_to(:action => 'show',:id => @meeting.id)
      flash[:notice] = "Meeting created successfully"
    else
      render 'new'
    end
  end

  def show
    @meeting = Meeting.find(params[:id])


  end

  def edit
    @times = {'9am' => 0, '10am' => 1, '11am' => 2, '12pm' => 3, '1pm' => 4, '2pm' => 5, '3pm' => 6, '4pm' => 7, '5pm' => 8}
    @days_hash = {:monday => 0, :tuesday => 1, :wednesday => 2, :thursday => 3, :friday => 4}

    @meeting = Meeting.find(params[:id])
  end

  def update

    @meeting = Meeting.find(params[:id])

    if @meeting.update_attributes(meeting_params)
      redirect_to(:action => 'show',:id => @meeting.id)
    else
      render('show')
    end
  end

  def delete
    @meeting = Meeting.find(params[:id])
  end

  def destroy
    Meeting.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end


  private
  def meeting_params
    params.require(:meeting).permit(:group_involved, :meeting_name, :agenda, :meeting_created_by, :memberID1, :memberID2,:memberID3, :memberID4,:memberID5, :memberID6, :start_time, :end_time, :title)
  end


end
