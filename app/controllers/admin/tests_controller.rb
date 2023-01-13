class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[ show edit update destroy start ]

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
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: 'Test was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: 'Test was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: "Test was successfully destroyed."
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
