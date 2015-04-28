require 'paper_trail/version_association_concern'

module PaperTrail
  class VersionAssociation < ::ActiveRecord::Base
    include PaperTrail::VersionAssociationConcern

    def self.create_version_associations_and_versions(assoc_version_args, model, association_options)
      self.create(assoc_version_args)
      if model.class.respond_to?(:paper_trail_options)
        model.enable_save_versions = true
        if (association_options.is_a? ::Hash)
          model.class.paper_trail_options.merge!(association_options.slice(:has_may, :has_one, :belongs_to))
          
        end
      end
    end
  end
end
