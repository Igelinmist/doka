class DocumentsController < InheritedResources::Base
  def new
    @document = Document.new(document_type_id: params[:document_type_id])
  end
  private
  def document_params
    params.require(:document).permit(:name, :registration_date, :document_type_id, properties: params[:document][:properties].keys)
  end
end
