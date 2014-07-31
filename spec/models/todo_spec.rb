require 'spec_helper'

describe Todo do

  let(:user)  { User.new(id: 1, f_name: "Matthew", l_name: "Larson", email: "email@email.com", password: "password", password_confirmation: "password") }

  before do
    @todo = user.todos.build(description: 'First ToDo', planned_complete_date: '1/1/2015', complete_date: '2/1/2015')
  end

  subject { @todo }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:planned_complete_date) }
  it { should respond_to(:complete_date) }

  describe "when description is not present" do
    before { @todo.description = " " }
    it { should_not be_valid }
  end

  describe "when a description is too long" do
    before { @todo.description = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when user_id is not nil" do
    before { @todo.user_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not 0" do
    before { @todo.user_id = 0 }
    it { should_not be_valid }
  end

  describe "when planned_complete_date is not valid" do
    before { @todo.planned_complete_date = 'xxxxxx' }
    it { should_not be_valid }
  end

  describe "when complete_date is not valid" do
    before { @todo.complete_date = 'xxxxxx' }
    it { should_not be_valid }
  end

  describe "when planned_complete_date is before today" do
    before { @todo.planned_complete_date = '7/24/2014' }
    it { should_not be_valid }
  end

  describe "when complete_date is before today" do
    before { @todo.complete_date = '7/24/2014' }
    it { should_not be_valid }
  end

  describe "when planned_complete_date is not required" do
    before { @todo.planned_complete_date = nil }
    it { should be_valid }
  end

  describe "when complete_date is not required" do
    before { @todo.complete_date = nil }
    it { should be_valid }
  end
end
