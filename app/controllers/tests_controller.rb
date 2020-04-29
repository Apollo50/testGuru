class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.passage_test(@test)
  end

  private

  def test_params
    params.require(:test).permit(:level, :title, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
