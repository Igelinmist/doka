class DocumentsController < InheritedResources::Base
  def new
    @document = Document.new(document_type_id: params[:product_type_id])
  end
  private
  def document_params
    params.require(:document).permit(:name, :registration_date)
  end
end
