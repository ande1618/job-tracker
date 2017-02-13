class ContactsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @contacts = @company.contacts
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save
    redirect_to company_contacts_path(@contact.company)
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
      if @contact.save
        flash[:success] = "#{@contact.name} updated!"
        redirect_to company_contacts_path(@contact.company)
      else
        render :edit
      end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:success] = "#{@contact.name} was successfully deleted!"
    redirect_to company_contacts_path(@contact.company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
