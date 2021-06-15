class InstructorsController < ApplicationController
before_action :set_instructor, only: [:update, :show, :destroy]

    # get ALL instructors
    def index
        instructors = Instructor.all 
        render json: instructors
    end

    # get one instructor
    def show
        render json: @instructor 
    end

    # create an instructor 
    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created 
    end

    #update an instructor
    def update
        @instructor.update(instructor_params)
        render json: @instructor
    end

    # delete an instructor
    def destroy 
        if @instructor
            @instructor.destroy
            render json: {}
        end
    end

    private

    def set_instructor 
        @instructor = Instructor.find(params[:id])
    end

    def instructor_params
        params.permit(:name)
    end


end
