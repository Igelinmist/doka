class DocumentTypesController < InheritedResources::Base
  private
  def document_type_params
    params.require(:document_type).permit(:name, fields_attributes: [:id, :field_type, :name, :required, :_destroy ])
  end
end
