class TutorsController < ApplicationController

    # before_filter :authenticate_tutor!, only: [:tutee_match]
    # before_filter :correct_tutor,   only: [:tutee_match]
     #before_filter :save_referer
     #after_filter :save_my_previous_url:, only: [:tutee_match]
     
    def show
    end
    
    def index
        #Should there be anything here?
    end

    def create
    end
    
    def new
       #Empty - something here?
    end
    
    #Display form for tutor to enter in attributes
    def edit
        @tutor = Tutor.find(params[:id])
        #set_session_var(@tutor)
        # set_session_var(@tutor)
        # session[:id] = @tutor.id
        # session[:redirected_tutee_path] = false
        #@original_request_url = request.original_url
    end

    #Update all of the attributes gathered from edit form
    def update
        begin
            @time_availabilitys_ids = params[:tutor][:time_availabilitys_ids]
            @tutor = Tutor.find(params[:id])
            @tutor.update_attributes!(tutor_params)
            @tutor.time_availabilitys.destroy_all
            if @time_availabilitys_ids != nil
                @time_availabilitys_ids.each do |id|
                    time = TimeAvailability.find(id)
                    @tutor.time_availabilitys << time
                end
            end
            flash[:notice] = "Form for #{@tutor.first_name + ' ' + @tutor.last_name} was succesfully created"
            redirect_to tutee_match_path(@tutor)
        rescue ActiveRecord::RecordInvalid => invalid   
            flash[:error] = invalid.record.errors
            redirect_to edit_tutor_path(@tutor)
        end    
    end
    
    def destroy
    end
    
    def tutor_params
        params.require(:tutor).permit(:first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio)
    end
    
    def tutee_match
   
      if (tutor_signed_in?)
          if(current_tutor.id.to_s != params[:id]) 
            params[:id] = current_tutor.id.to_s
            redirect_to tutee_match_path(current_tutor)
          end
      end
      @tutor = Tutor.find(params[:id])
      @tutees = @tutor.tutees
      if @tutees.empty?
          @display_text = "You have not been assigned any students yet."
      end
    end
    

    def correct_tutor
        
        # if (session[:redirected_tutee_path])
        #     return
        # else
        #     if (session[:id].to_s != params[:id])
                
        #         session[:redirected_tutee_path] = true
        #       @previous_path = session[:http_referer]
               
        #         redirect_to @previous_path
        #     end    
        # end
        if (session[:id].to_s != params[:id])
            redirect_to root_path
        end
    end


end



