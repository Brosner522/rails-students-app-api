class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students
    end

    def show
    student = Student.find(params[:id])
    render json: student 
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        student = Student.find(params[:id])
        student.update(student_params)
        render json: student
    end

    def destroy
        student = Student.find(params[:id])
        if student
            student.destroy 
        end
    end


    private 


    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end


end
