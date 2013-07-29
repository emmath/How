class StepsController < ApplicationController
  before_filter :find_topic
  before_filter :find_step, only: [:show, :edit, :update, :destroy]


  def new
    @step = @topic.steps.build
  end

  def create
    @step = @topic.steps.build(params[:step])
    if @step.save
      flash[:notice] = "Step has been created."
      redirect_to [@topic, @step]
    else
      flash[:alert] = "Step has not been created."
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @step.update_attributes(params[:step])
      flash[:notice] = "Step has been updated."
      redirect_to [@topic, @step]
    else
      flash[:alert] = "Step has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @step.destroy
    flash[:notice] = "Step has been deleted."
    redirect_to @topic
  end
private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def find_step
    @step = @topic.steps.find(params[:id])
  end
end
