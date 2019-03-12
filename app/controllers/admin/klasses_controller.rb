# frozen_string_literal: true

class Admin::KlassesController < AdminController
  layout 'internal'

  def index
    @klasses = Klass.all
  end

  def show
    @klass = Klass.find(params[:id])
    @attendances = @klass.attendances.all
  end

  def new
    @klass = Klass.new
  end

  def create
    @klass = Klass.new(klass_params)

    if @klass.save
      flash[:success] = 'klass was created succesfully.'
      redirect_to admin_klasses_path
    else
      flash[:error] = 'Something went wrong.'
      render :new
    end
  end

  def edit
    @klass = Klass.find(params[:id])
  end

  def update
    @klass = Klass.find(params[:id])

    if @klass.update(klass_params)
      flash[:success] = 'The klass was updated succesfully.'
      redirect_to admin_klasses_path
    else
      render :edit
    end
  end

  def disable_student
    @klass = Klass.find(params[:klass_id])
    @klass.disable_student(params[:student_id])
    redirect_to admin_klasses_path
  end

  def destroy
    @klass = Klass.find(params[:id])
    @klass.destroy

    flash['success'] = 'klass was removed successfully.'
    redirect_to admin_klasses_path
  end

  private

  def klass_params
    params.require(:klass).permit(:name, teacher_ids: [], student_ids: [])
  end
end
