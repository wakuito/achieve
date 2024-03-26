class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if params[:back]
      render :new
    else
      if @contact.save
        redirect_to contacts_path, notice: "問い合わせを受け付けました"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
