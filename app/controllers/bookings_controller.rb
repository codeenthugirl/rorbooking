class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @name = username
  end

  def create
    @user = session[:user]
    @booking = Booking.new(booking_params)
    @booking.user_id = @user["id"]
    if @booking.save
      redirect_to '/bookings/show'
    else
      render '/bookings/new'
    end
  end

  def edit
    @booking = findbooking
    @name = username
  end

  def show 
    @booking = Booking.where(user_id: session[:user]["id"])
    @name = username
  end

  def update
    @booking = findbooking
    if @booking.update(booking_params)
      redirect_to '/bookings/show'
    else
      render '/bookings/edit'
    end
  end

  def destroy
    @booking = findbooking
    @booking.destroy
    redirect_to '/bookings/show'
  end

  def logout
    redirect_to '/'
  end

  private 

    def booking_params
    params.require(:booking).permit(:seat,:fromdate,:todate)
    end

    def username
      session[:user]["name"]
    end

    def findbooking
      Booking.find_by(id: params[:id])
    end

end
