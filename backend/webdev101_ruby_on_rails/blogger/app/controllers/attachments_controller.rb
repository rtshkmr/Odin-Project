class AttachmentsController < ApplicationController
    def new
        @attachment = Attachment.new
    end
    
end
