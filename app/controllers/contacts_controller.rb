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

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
