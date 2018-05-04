class ContactsController < ApplicationController
  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:notice] = 'お問い合わせを送信しました'
      redirect_to new_contact_path
    else
      render 'new'
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    render 'new' if @contact.invalid?
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
