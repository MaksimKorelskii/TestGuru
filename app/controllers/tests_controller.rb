class TestsController < ApplicationController
  before_action :find_test, only: %i[ show edit update destroy ]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, notice: 'Test was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path, notice: "Question was successfully destroyed."
  end

  protected

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :title, :level, :category_id)
  end
end
