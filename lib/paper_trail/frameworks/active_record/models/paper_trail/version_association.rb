require 'paper_trail/version_association_concern'

module PaperTrail
  class VersionAssociation < ::ActiveRecord::Base
    include PaperTrail::VersionAssociationConcern

    def self.create_version_associations_and_versions(assoc_version_args, association_options)
      self.create(assoc_version_args)
    end
  end
end
