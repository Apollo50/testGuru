class TestsController < ApplicationController
  before_action :find_test, only: %i[start show edit update destroy]
  before_action :set_user, only: %i[start]

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
    @user.tests.push(@test)
    redirect_to @user.passage_test(@test)
  end

  private

  def test_params
    params.require(:test).permit(:level, :title, :category_id)
  end

  def set_user
    @user = User.first
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
