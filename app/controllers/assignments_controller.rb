class AssignmentsController < ApplicationController

  def create
    @assignment = current_user.assignments.new(assignment_params)
    if @assignment.save
      #flash[:notice] = "#{@assignment.project} created!"
    else
      flash[:error] = "error saving!"
    end
  end

  private
    def assignment_params
      params.require(:assignment).permit(:project, :allocation_percentage, :project_frequency, :start_date, :end_date, :employee_id)
    end
end