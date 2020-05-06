class AdminUsersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin_users
  # GET /admin_users.json
  def index
    @admin_users = User.where.not(email: "admin@brainio.com")
  end

  # GET /admin_users/1
  # GET /admin_users/1.json
  def show
  end

  # GET /admin_users/new
  def new
    @admin_user = User.new
  end

  # GET /admin_users/1/edit
  def edit
  end

  # POST /admin_users
  # POST /admin_users.json
  def create
    @admin_user = User.new(admin_user_params)
    respond_to do |format|
      if @admin_user.save
        @admin_user.add_role :admin if (params[:role] == "Admin") && (!@admin_user.has_role? :admin)
        format.html { redirect_to admin_users_path, notice: "#{@admin_user.email} successfully created." }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_users/1
  # PATCH/PUT /admin_users/1.json
  def update

    respond_to do |format|
      if @admin_user.update(admin_user_params)
        @admin_user.add_role :admin if (params[:role] == "Admin") && (!@admin_user.has_role? :admin) 
        @admin_user.remove_role :admin if (params[:role] == "User") && (@admin_user.has_role? :admin)
        format.html { redirect_to admin_users_path, notice: "#{@admin_user.email} successfully updated." }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_users/1
  # DELETE /admin_users/1.json
  def destroy
    if @admin_user.is_active
      @admin_user.update_attributes(is_active: false)
    else
      @admin_user.update_attributes(is_active: true)
    end
    # @admin_user.destroyed
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User status successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:user).permit(:email, :password, :name)
    end
end
