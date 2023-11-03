module FormHelper
  def projects_for_select
    Project.order(:name).pluck(:name, :id)
  end

  def epics_for_select
    @current_project.epics.order(:name).pluck(:name, :id)
  end
end
